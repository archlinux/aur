# Maintainer: BrainwreckedTech <bwt at bwt dot com dot de>
# Previous Maintainer: Andrew Steinke <rkcf at rkcf dot me>

pkgname=cockpit-zfs-manager
pkgver=1.3.0
pkgrel=1
pkgdesc="An interactive ZFS on Linux admin package for Cockpit"
arch=('any')
url="https://github.com/45Drives/cockpit-zfs-manager"
license=('GPL3')
depends=('cockpit' 'zfs')
source=("https://github.com/45Drives/cockpit-zfs-manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('296a44b932a5846e882e2bedd3bd2a1e8a57345518ac08b902df7bca3acf925f')

package() {
  install -dm755 "$pkgdir"/usr/share/cockpit/zfs

  for file in $(find "$srcdir/$pkgname-$pkgver/zfs/" -type f ); do
    install -Dm644 "$file" "$pkgdir"/usr/share/cockpit/zfs/;
  done
}
