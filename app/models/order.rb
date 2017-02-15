class Order < ApplicationRecord
  before_create :generate_token

  def generate_token
    self.token= SecureRandom.uuid
  end

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)

belongs_to :user
has_many :product_lists
validates :billing_name, presence:{message: "请填写购买人姓名"}
validates :billing_address, presence: {message: "请填写购买人地址"}
 validates :shipping_name, presence: {message: "请填写收件人姓名"}
 validates :shipping_address, presence: {message: "请填写收件人地址"}
end
