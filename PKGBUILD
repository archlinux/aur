# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# POST-INSTALLATION INSTRUCTIONS
#
# WeeChat is unable to source files from outside of a user's home directory.
# Because of this limitation, this package *DOES NOT* make this plugin available
# to WeeChat without end user interaction.
#
# Each user who wants to enable this plugin needs to create symlinks in the
# WeeChat configuration directory for their user (by default, ~/.weechat). The
# following command(s) will accomplish this:
#
#     $ ln -s /usr/lib/weechat/python/notify_send.py ~/.weechat/python/autoload/notify_send.py

pkgname=weechat-notify-send
pkgver=0.9
pkgrel=2
pkgdesc="A WeeChat script that sends highlight and message notifications through notify-send"
url='https://github.com/s3rvac/weechat-notify-send'
arch=('any')
license=('MIT')
depends=(
  'libnotify'
  'python'
  'weechat'
)
source=("${pkgname}_${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('108c094ab9080581284255bd7c9aa8f4d9dcb836b91a082c21370810b60eabbc8825d37deffa651d650d24427fdf45233d08b5225c710e7e63450cda45f9c1f1')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install the plugin script
  install -Dm644 notify_send.py ${pkgdir}/usr/lib/weechat/python/notify_send.py

  # Install the plugin license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
