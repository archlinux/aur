pkgname=zam-web
pkgver=1.67.19
pkgrel=1
pkgdesc="Zam Matrix Client for Web."
arch=(any)
url=https://matrix.crafty.moe/
license=(GPL-3.0-only)
makedepends=(npm)
source=("Zam-$pkgver.tar.gz::https://github.com/az4521/Zam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('27fa6c32f1de99fbc8e12a394be0181203cbc54220d77bdefda6ba42bfc54404')

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
