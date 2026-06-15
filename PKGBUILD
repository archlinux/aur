# Maintainer: Skxxtz <your@email.com>
pkgname=sherlock-confetti
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight confetti animation overlay for Wayland compositors"
arch=('x86_64')
url="https://github.com/Skxxtz/sherlock-confetti"
license=('MIT')
depends=(
    'vulkan-icd-loader'
    'mesa'
    'wayland'
    'wayland-protocols'
)
makedepends=(
    'rust'
    'cargo'
    'libxkbcommon'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Skxxtz/sherlock-confetti/archive/refs/tags/1.0.0.tar.gz")
sha256sums=('f99014a006b93dd318ac2b6589231a0af6ffa6c2e405039d66ca5c672f5d5491')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/confetti "$pkgdir/usr/bin/confetti"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
