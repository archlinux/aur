# Maintainer: figr <figr@gmx.de>
pkgname=music-ratatui
pkgver=0.4.5
pkgrel=1
pkgdesc="A terminal musicplayer build with Ratatui."
arch=('x86_64')
url="https://gitlab.com/figr/music-ratatui"
license=('GPL-3.0')
depends=('gcc' 'sqlite')
conflicts=('music-ratatui-bin' 'music-ratatui-bin-debug')
makedepends=('rust' 'cargo' 'pkgconf' 'git' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
source=("git+https://gitlab.com/figr/music-ratatui.git#tag=v$pkgver")
options=('!lto')
sha256sums=('caa0caa139e07191e8fc78c8db5d3cf7c4e42565c22aada378231b6c3a8b46a9')

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
