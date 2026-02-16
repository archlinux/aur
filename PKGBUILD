# Maintainer: zlicdt <xkicdt1@gmail.com>

pkgname=rchan
pkgver=1.1.0
pkgrel=1
pkgdesc="A bot that checks for PKGBUILD updates in custom Arch Linux package repositories"
arch=('x86_64')
url="https://github.com/ReSpringClipsNeko/rchan"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ReSpringClipsNeko/rchan/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('539a0c81a6eb09fbba68c799d0bfaba0e767fff803612a278cba71f390a7bbe0')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
