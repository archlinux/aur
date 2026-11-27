pkgname=zam-web
pkgver=1.67.17
pkgrel=1
pkgdesc="Zam Matrix Client for Web."
arch=(any)
url=https://matrix.crafty.moe/
license=(GPL-3.0-only)
makedepends=(npm)
source=("Zam-$pkgver.tar.gz::https://github.com/az4521/Zam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2760dd3841cb640b208388d1d6b4cd9f97005f28cff62511fbee547303203ea6')

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
