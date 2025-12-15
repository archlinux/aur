# Maintainer: shinzo <pahasaradev@proton.me>

pkgname=hyprsnow
pkgver=0.1.6
pkgrel=1
pkgdesc="A snow overlay for Wayland/Hyprland"
arch=('x86_64')
url="https://github.com/spinualexandru/hyprsnow"
license=('MIT')
depends=('hyprland')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/spinualexandru/hyprsnow.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
