# Maintainer: xander-lin <xander-lin@users.noreply.github.com>
pkgname=screenshot-niri
pkgver=0.1.0
pkgrel=1
pkgdesc="Screenshot tool for niri compositor with scroll/stitch support"
arch=('x86_64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
makedepends=('rust' 'cargo' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/screenshot "$pkgdir/usr/bin/screenshot"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE 2>/dev/null || true
}
