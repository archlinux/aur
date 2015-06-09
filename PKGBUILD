# Maintainer: Don Harper <duck at duckland dot org>

pkgname=usbmount
pkgver=0.0.22
pkgrel=1
epoch=
pkgdesc="automatically mount and unmount USB mass storage devices"
arch=('any')
url="https://launchpad.net/ubuntu/+source/usbmount/"
license=('BSD')
depends=('lockfile-progs' 'udev')
install="$pkgname.install"
changelog=
_debtar="$pkgname-$pkgver.tar.gz"
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${_debtar//-/_})
md5sums=('ac06283b079382984ba12babac3ad73d')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/etc/usbmount/mount.d
  mkdir -p $pkgdir/etc/usbmount/umount.d
  mkdir -p $pkgdir/usr/share/usbmount
  mkdir -p $pkgdir/etc/usbmount
  mkdir -p $pkgdir/usr/share/licenses/usbmount
  mkdir -p $pkgdir/usr/lib/udev/rules.d
  install -m 0755 00_create_model_symlink $pkgdir/etc/usbmount/mount.d
  install -m 0755 00_remove_model_symlink $pkgdir/etc/usbmount/umount.d
  install -m 0755 usbmount                $pkgdir/usr/share/usbmount
  install -m 0644 usbmount.conf           $pkgdir/etc/usbmount
  install -m 0644 usbmount.rules          $pkgdir/usr/lib/udev/rules.d
  install -m 0444 debian/copyright        $pkgdir/usr/share/licenses/usbmount
}

# vim:set ts=2 sw=2 et:
