# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=weechat-notify-send
pkgver=0.10
pkgrel=1
pkgdesc="A WeeChat script that sends highlight and message notifications through notify-send"
url='https://github.com/s3rvac/weechat-notify-send'
arch=('any')
license=('MIT')
depends=(
  'libnotify'
  'python'
  'weechat'
)
install=$pkgname.install
source=("${pkgname}_${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('8c52061b52976f9619899288b1d831d5da6d333eaf3c9950f3bde4cce2dc8650517c420d3518597bc04e44a3154a44038a153a59a598d8cae5b2f9c066ca87e8')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install the plugin script
  install -Dm644 notify_send.py ${pkgdir}/usr/share/weechat/python/notify_send.py

  # Install the plugin license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
