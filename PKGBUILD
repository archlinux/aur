# Maintainer: nekgem2 <nekgem2@firemail.cc>
pkgname=zcash-bin
pkgver=5.9.0
pkgrel=1
pkgdesc="Permissionless financial system employing zero-knowledge security (bin)"
arch=('x86_64')
url="https://z.cash/"
license=('MIT')
provides=("zcash=$pkgver")
conflicts=('zcash')
source=("https://github.com/zcash/artifacts/raw/master/v$pkgver/bookworm/zcash-$pkgver-linux64-debian-bookworm.tar.gz"
        'zcashd.service')
sha256sums=('ccbb2204a8af57b601f36df6c0528bf598b9aff47ad5956f2ab8eec2e49fe018'
            '7b0919ac447824199aff8c17b5a5799b46414818c6aed314506c5295d0ce9ccd')

package() {
  install -d "$pkgdir/usr"
  cp -r "zcash-$pkgver/"* "$pkgdir/usr/"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" zcashd.service
}
