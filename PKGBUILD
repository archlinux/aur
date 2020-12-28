# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=cockpit-zfs-manager
pkgver=0.3.4.514
pkgrel=1
pkgdesc="An interactive ZFS on Linux admin package for Cockpit"
arch=('any')
url="https://github.com/optimans/cockpit-zfs-manager"
license=('GPL3')
depends=('cockpit' 'zfs')
source=("https://github.com/optimans/cockpit-zfs-manager/archive/$pkgver.tar.gz")
md5sums=('c4066a4696d765b4c0d3c82ee11bc75c')

package() {
  install -dm755 "$pkgdir"/usr/share/cockpit/zfs

  for file in $(find "$srcdir/$pkgname-$pkgver/zfs/" -type f ); do
    install -Dm644 "$file" "$pkgdir"/usr/share/cockpit/zfs/;
  done
}

# vim:set ts=2 sw=2 et:
