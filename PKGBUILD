# Maintainer: nekgem2 <nekgem2@firemail.cc>
pkgname=zcash-bin
pkgver=5.10.0
pkgrel=1
pkgdesc="Permissionless financial system employing zero-knowledge security (bin)"
arch=('x86_64')
url="https://z.cash/"
license=('MIT')
provides=("zcash=$pkgver")
conflicts=('zcash')
source=("https://apt.z.cash/pool/main/z/zcash_${pkgver}_amd64.deb"
        'zcashd.service')
sha256sums=('e59b8237ec5e344e03901551949aeaab5da73a645bc9979915a6789e48ba0d88'
            '7b0919ac447824199aff8c17b5a5799b46414818c6aed314506c5295d0ce9ccd')

prepare() {
  tar xf data.tar.xz
}

package() {
  install -d "$pkgdir/usr"
  cp -r "usr/"* "$pkgdir/usr/"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" zcashd.service
}
