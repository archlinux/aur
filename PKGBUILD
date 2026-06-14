# Maintainer: whymusticode <billGat48@proton.me>
pkgname=wlgrid
pkgver=1.0
pkgrel=1
pkgdesc="Wayland layer-shell grid launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/whymusticode/wlgrid"
license=('custom')
depends=('libxkbcommon' 'wayland' 'libglvnd')
makedepends=('rust' 'clang' 'mold')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/wlgrid "$pkgdir/usr/bin/wlgrid"
    install -Dm644 config.toml.default "$pkgdir/usr/share/wlgrid/config.toml.default"
}
