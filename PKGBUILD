# Maintainer: zlicdt <xkicdt1@gmail.com>

pkgname=rchan
pkgver=1.2.0
pkgrel=1
pkgdesc="A bot that checks for PKGBUILD updates in custom Arch Linux package repositories"
arch=('x86_64')
url="https://github.com/ReSpringClipsNeko/rchan"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ReSpringClipsNeko/rchan/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a741ef2ea40df009b09451b496ee8663e2897e3f0b7a43b6380cc11c82e586a8')

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
