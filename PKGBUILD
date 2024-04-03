# Maintainer: MaxSt
pkgname=zprint-bin
pkgver=1.2.9
pkgrel=1
pkgdesc="Reformat Clojure and Clojurescript source code and s-expressions"
url="https://github.com/kkinnear/zprint"
license=('MIT')
makedepends=()
depends=(zlib)
arch=('i686' 'x86_64')
source=(
    "https://github.com/kkinnear/zprint/releases/download/$pkgver/zprintl-$pkgver"
    "https://raw.githubusercontent.com/kkinnear/zprint/master/LICENSE"
)
md5sums=(
    '2430e4969191a0b0210243f7d532e7b6'
    '7199ed1f0ff55f6f8a1d191272e13f71'
)

pkgver() {
    echo "$pkgver"
}

package() {
    echo "$pkgname"
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp "$srcdir/zprintl-$pkgver" "$pkgdir/usr/bin/zprint"
    chmod +x "$pkgdir/usr/bin/zprint"
    install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


