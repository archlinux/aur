# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
pkgname=slimbookintelcontroller
pkgver=0.4beta
pkgrel=1
pkgdesc="Application for the performance management of Intel processors"
arch=('any')
url="https://github.com/slimbook/slimbookintelcontroller"
license=('GPL2')
depends=('dbus-python' 'gtk3' 'intel-undervolt' 'libappindicator-gtk3' 'libnotify'
         'mokutil' 'pciutils' 'python-gobject' 'python-pillow' 'systemd-libs')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('6a53f644252aac7e0b48021d65d55a0ebea7cadaecec06338bf6f0b995ee52ea')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  # Install locales
#  cd "$pkgdir/usr/share/$pkgname/src/translations"
#  for lang in $(ls -d */); do
#    install -d "$pkgdir/usr/share/locale/${lang}LC_MESSAGES"
#    mv "$pkgdir/usr/share/$pkgname/src/translations/${lang}LC_MESSAGES"/*.mo \
#      "$pkgdir/usr/share/locale/${lang}LC_MESSAGES"
#  done
#  rm -rf "$pkgdir/usr/share/$pkgname/src/translations"
#  rm "$pkgdir/usr/share/$pkgname/src/update_po.sh"

  # App permissions
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
}
