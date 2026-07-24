# Maintainer: zlicdt <xkicdt1@gmail.com>

pkgname=rchan
pkgver=1.2.1
pkgrel=1
pkgdesc="A bot that checks for PKGBUILD updates in custom Arch Linux package repositories"
arch=('x86_64')
url="https://github.com/ReSpringClipsNeko/rchan"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ReSpringClipsNeko/rchan/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c82d2614af9593f9f468558e8c5f3a9c786d1161f1e3cdcb05e08492316cc3b')

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
