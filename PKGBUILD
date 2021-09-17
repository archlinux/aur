# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=slimbookamdcontroller
pkgver=0.3.4beta
pkgrel=3
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://slimbook.es"
license=('GPL')
depends=('dbus-python' 'libappindicator-gtk3' 'libnotify' 'python-gobject'
         'python-pillow' 'python-pyamdgpuinfo' 'ryzenadj' 'systemd-libs')
install="$pkgname.install"
source=("https://github.com/slimbook/slimbookamdcontroller/releases/download/Test/${pkgname}_${pkgver}_all.deb")
sha256sums=('221448371218785671e50f5acce9a8b0d4497d34bb88ba93dd6d8417a0544790')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  ln -s /usr/bin/ryzenadj "$pkgdir/usr/share/$pkgname"

  # App permissions
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
  chmod -R 755 "$pkgdir/usr/share/$pkgname/src"
}
