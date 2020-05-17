# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=cockpit-zfs-manager
pkgver=0.3.1.301
pkgrel=1
pkgdesc="An interactive ZFS on Linux admin package for Cockpit"
arch=('any')
url="https://github.com/optimans/cockpit-zfs-manager"
license=('GPL3')
depends=('cockpit' 'zfs')
source=("https://github.com/optimans/cockpit-zfs-manager/archive/$pkgver.tar.gz")
md5sums=('81f9b3b9eb426fad458360d23e899710')

package() {
  install -dm755 "$pkgdir"/usr/share/cockpit/zfs

  for file in $(find "$srcdir/$pkgname-$pkgver/zfs/" -type f ); do
    install -Dm644 "$file" "$pkgdir"/usr/share/cockpit/zfs/;
  done
}

# vim:set ts=2 sw=2 et:
