# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=slimbookamdcontroller
pkgver=0.3.2beta
pkgrel=2
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://slimbook.es"
license=('GPL')
depends=('dbus-python' 'libappindicator-gtk3' 'libnotify' 'python-gobject'
         'python-pillow' 'ryzenadj' 'systemd-libs')
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('5de2a33459440fe2c06f51c48abe6cac2b9a9d640cfc937274837f6859fdefb1')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/bin/$pkgname-pkexec" "$pkgdir/usr/bin/"
  rm -rf "$pkgdir/bin"

  ln -s /usr/bin/ryzenadj "$pkgdir/usr/share/$pkgname"
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
}
