# Maintainer: nekgem2 <nekgem2@firemail.cc>
pkgname=zcash-bin
pkgver=5.4.0
pkgrel=1
pkgdesc="Permissionless financial system employing zero-knowledge security (bin)"
arch=('x86_64')
url="https://z.cash/"
license=('MIT')
provides=("zcash=$pkgver")
conflicts=('zcash')
source=("https://z.cash/downloads/zcash-$pkgver-linux64-debian-bullseye.tar.gz"
        'zcashd.service')
sha256sums=('d4ae16e06a29c0c8d31f5d109da83a374acaacc40032ab35cce017f47cdc7bae'
            '7b0919ac447824199aff8c17b5a5799b46414818c6aed314506c5295d0ce9ccd')

package() {
  install -d "$pkgdir/usr"
  cp -r "zcash-$pkgver/"* "$pkgdir/usr/"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" zcashd.service
}
