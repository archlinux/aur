# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=frece
pkgver=1.0.1
pkgrel=1
pkgdesc="Frecency sorted database"
arch=("x86_64")
url="https://github.com/YodaEmbedding/frece"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/YodaEmbedding/frece/archive/$pkgver.tar.gz")
sha256sums=("af5cb178df8ef9a7f7d2ce7d76a9c794e8b1222c6dc0d7e884bd09adc65aed85")

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/frece" "$pkgdir/usr/bin/frece"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/frece/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/frece/README.md"
}
