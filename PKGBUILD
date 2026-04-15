# Maintainer: IovAnto <iovine.antonio44@gmail.com>
pkgname=b-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple TUI wrapper for bluetoothctl, built with Rust and Ratatui."
arch=('x86_64')
url="https://github.com/IovAnto/b-tui"
license=('MIT')
depends=('bluez-utils' 'dbus')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IovAnto/b-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/b-tui" "$pkgdir/usr/bin/b-tui"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
