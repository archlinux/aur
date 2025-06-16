# Maintainer: BrainwreckedTech <bwt at bwt dot com dot de>
# Previous Maintainer: Andrew Steinke <rkcf at rkcf dot me>

pkgname=cockpit-zfs-manager
pkgver=1.3.1
pkgrel=1
pkgdesc="An interactive ZFS on Linux admin package for Cockpit"
arch=('any')
url="https://github.com/45Drives/cockpit-zfs-manager"
license=('LGPL-3.0-or-later')
depends=('cockpit' 'zfs')
source=("https://github.com/45Drives/cockpit-zfs-manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('859bb2b3d459ef959d1ef85f4eab21354a92edbabcf0932f04523d972fccc6bf')

package() {
  install -dm755 "$pkgdir"/usr/share/cockpit/zfs

  for file in $(find "$srcdir/$pkgname-$pkgver/zfs/" -type f ); do
    install -Dm644 "$file" "$pkgdir"/usr/share/cockpit/zfs/;
  done
}
