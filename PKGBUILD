# Maintainer: xander-lin <xander-lin@users.noreply.github.com>
# If Gitee is unreachable, edit source to:
#   source=("screenshot-niri::git+https://github.com/xander-lin/screenshot-niri.git")
pkgname=screenshot-niri
pkgver=0.1.0
pkgrel=2
pkgdesc="Screenshot tool for niri compositor with scroll/stitch support"
arch=('x86_64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
makedepends=('rust' 'cargo' 'git')
_gitee="https://gitee.com/xander-lin/screenshot-niri.git"
_github="https://github.com/xander-lin/screenshot-niri.git"
source=("screenshot-niri::git+${_gitee}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/screenshot-niri"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

package() {
    cd "$srcdir/screenshot-niri"
    install -Dm755 target/release/screenshot "$pkgdir/usr/bin/screenshot"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE 2>/dev/null || true
}
