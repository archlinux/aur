# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=frece
pkgver=1.0.3
pkgrel=1
pkgdesc="Frecency sorted database"
arch=("x86_64")
url="https://github.com/YodaEmbedding/frece"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/YodaEmbedding/frece/archive/$pkgver.tar.gz")
sha256sums=("b62f184f461631aeee86c24978ddf3359ef16fe872a9f4523bc8d5ba6d6c5cba")

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
