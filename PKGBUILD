# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=frece
pkgver=1.0.4
pkgrel=1
pkgdesc="Frecency sorted database"
arch=("x86_64")
url="https://github.com/YodaEmbedding/frece"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/YodaEmbedding/frece/archive/$pkgver.tar.gz")
sha256sums=("b8d0b894a8f693718986db6a49071effc7d6de523d385e8fdd12b663d99c8f09")

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
