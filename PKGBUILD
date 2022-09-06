# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
pkgname=slimbookintelcontroller
pkgver=0.5beta
pkgrel=1
pkgdesc="Application for the performance management of Intel processors"
arch=('any')
url="https://github.com/slimbook/slimbookintelcontroller"
license=('GPL2')
depends=('dbus-python' 'gtk3' 'intel-undervolt' 'libayatana-appindicator' 'libnotify'
         'mokutil' 'pciutils' 'python-gobject' 'python-pillow' 'systemd-libs')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('8dadbfabddda81137ac80e46f4c52752c293f40c70133b4ee29c15668eaea87b')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  # App permissions
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
}
