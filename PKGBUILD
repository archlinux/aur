pkgname=zam-web
pkgver=1.67.15
pkgrel=1
pkgdesc="Zam Matrix Client for Web."
arch=(any)
url=https://matrix.crafty.moe/
license=(GPL-3.0-only)
makedepends=(npm)
source=("Zam-$pkgver.tar.gz::https://github.com/az4521/Zam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('11b2398b0bf33f315d371ca2e412e8b5c771d3a753d08dd0181a54c2e7b09d3d')

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
