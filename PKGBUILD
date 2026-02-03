# Maintainer: Jack Ratermann <jackratermann@gmail.com>
pkgname=hermes-pm
provides=('hermes')
conflicts=('hermes')
pkgver=0.1.0
pkgrel=1
pkgdesc="A beautiful TUI package manager for Arch Linux"
arch=('x86_64')
url="https://github.com/Ap0ll02/hermes"
license=('MIT')
depends=('pacman')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c2210334469b4a502a42f4f8f70c2a2923b1a31e0462eebc24042992b06e4c5')

build() {
    cd "$pkgname-$pkgver/hermes_pm"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver/hermes_pm"
    cargo test --release
}

package() {
    cd "$pkgname-$pkgver/hermes_pm"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    # install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
}
