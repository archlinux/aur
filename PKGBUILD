# Maintainer: nekgem2 <nekgem2@firemail.cc>
pkgname=zcash-bin
pkgver=5.9.1
pkgrel=1
pkgdesc="Permissionless financial system employing zero-knowledge security (bin)"
arch=('x86_64')
url="https://z.cash/"
license=('MIT')
provides=("zcash=$pkgver")
conflicts=('zcash')
source=("https://github.com/zcash/artifacts/raw/master/v$pkgver/bookworm/zcash-$pkgver-linux64-debian-bookworm.tar.gz"
        'zcashd.service')
sha256sums=('3229e5a2c54a90f93530f93f9c59b0e134c9b95d9ed3754a4635f749586f7fd0'
            '7b0919ac447824199aff8c17b5a5799b46414818c6aed314506c5295d0ce9ccd')

package() {
  install -d "$pkgdir/usr"
  cp -r "zcash-$pkgver/"* "$pkgdir/usr/"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" zcashd.service
}
