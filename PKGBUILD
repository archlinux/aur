# Maintainer: nekgem2 <nekgem2@firemail.cc>
pkgname=zcash-bin
pkgver=5.3.2
pkgrel=1
pkgdesc="Permissionless financial system employing zero-knowledge security (bin)"
arch=('x86_64')
url="https://z.cash/"
license=('MIT')
provides=("zcash=$pkgver")
conflicts=('zcash')
source=("https://z.cash/downloads/zcash-$pkgver-linux64-debian-bullseye.tar.gz"
        'zcashd.service')
sha256sums=('20b0aa39b72826fe5c2d967151ce8cccbd11c1cf1b6c2adf8ddad0c596e241fc'
            '7b0919ac447824199aff8c17b5a5799b46414818c6aed314506c5295d0ce9ccd')

package() {
  install -d "$pkgdir/usr"
  cp -r "zcash-$pkgver/"* "$pkgdir/usr/"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" zcashd.service
}
