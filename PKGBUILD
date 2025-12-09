# Maintainer: 
pkgname=stryde-git
pkgver=0.2.0.r$(date +%Y%m%d)
pkgrel=1
pkgdesc="Application launcher for Linux written in Rust"
arch=('x86_64')
url="https://github.com/dest-lab/stryde"
license=('MIT')
depends=('libgl' 'libx11' 'libxrandr' 'libxcb')
makedepends=('rust' 'cargo' 'pkgconf' 'xorg-server' 'libx11' 'libxrandr' 'wayland' 'wayland-protocols' 'xcb-util' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libx11' 'libxkbcommon-x11')
provides=('stryde')
conflicts=('stryde')
replaces=()
options=(!lto)
source=("git+https://github.com/dest-lab/stryde.git")
sha512sums=('SKIP')
build() {
    cd "$srcdir/stryde"
    cargo build --release
}
package() {
    cd "$srcdir/stryde"
    install -Dm755 "target/release/stryde" "${pkgdir}/usr/bin/stryde"
}
