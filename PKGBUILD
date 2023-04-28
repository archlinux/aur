# Maintainer: BrainwreckedTech <bwt at bwt dot com dot de>
# Previous Maintainer: Andrew Steinke <rkcf at rkcf dot me>

pkgname=cockpit-zfs-manager
pkgver=1.3.0
pkgrel=5
pkgdesc="An interactive ZFS on Linux admin package for Cockpit"
arch=('any')
url="https://github.com/45Drives/cockpit-zfs-manager"
license=('GPL3')
depends=('cockpit' 'zfs')
source=("https://github.com/45Drives/cockpit-zfs-manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('16fcce1bff48910ed46e9c99c2ab36733a7d326cd7ee29803646bb2d07dc67fd')

package() {
  install -dm755 "$pkgdir"/usr/share/cockpit/zfs

  for file in $(find "$srcdir/$pkgname-$pkgver/zfs/" -type f ); do
    install -Dm644 "$file" "$pkgdir"/usr/share/cockpit/zfs/;
  done
}
