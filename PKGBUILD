pkgname=zam-web
pkgver=1.67.16
pkgrel=1
pkgdesc="Zam Matrix Client for Web."
arch=(any)
url=https://matrix.crafty.moe/
license=(GPL-3.0-only)
makedepends=(npm)
source=("Zam-$pkgver.tar.gz::https://github.com/az4521/Zam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7b61370cb1a10932f6d1b8ccb6ebfc7ffe2de61bad04d72e38575c27f5db765')

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
