# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=weechat-notify-send
pkgver=0.11
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
sha512sums=('e8d43b2e30c07c92ab9e343dbeacb29c5579d298580f36ba159338aafb80a83fb42f4dfa79b1b6f69b577ba2cf84843769c151fab0ef0ff50baaefdf52ce1494')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install the plugin script
  install -Dm644 notify_send.py ${pkgdir}/usr/share/weechat/python/notify_send.py

  # Install the plugin license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
