# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=frece
pkgver=1.0.0
pkgrel=1
pkgdesc="Frecency sorted database"
arch=("x86_64")
url="https://github.com/SicariusNoctis/frece"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/SicariusNoctis/frece/archive/$pkgver.tar.gz")
sha256sums=("f667b8ade5d6a2bba214a4227e5e980cd4b9be4c53683cacb7f1a3327189f3b9")

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
