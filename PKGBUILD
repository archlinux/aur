pkgname=zam-web
pkgver=1.67.20
pkgrel=1
pkgdesc="Zam Matrix Client for Web."
arch=(any)
url=https://matrix.crafty.moe/
license=(GPL-3.0-only)
makedepends=(npm)
source=("Zam-$pkgver.tar.gz::https://github.com/az4521/Zam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e352f966ff1e1aea733905b08b0983fa2e95917a581da6fbd1f612ace8d9f1b3')

prepare() {
    cd "Zam-$pkgver"
    npm ci
}

build() {
    cd "Zam-$pkgver"
    npm run build
}

package() {
    mkdir -p "$pkgdir/usr/share/webapps"
    cp -a --no-preserve=ownership "Zam-$pkgver/build" "$pkgdir/usr/share/webapps/zam"
}
