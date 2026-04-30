# Maintainer: figr <figr@gmx.de>
pkgname=music-ratatui
pkgver=0.4.1
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
sha256sums=('794ce0bd117d05a7185747dda7a2b1ef26466f7a730fa1036df8a5fbccb555e4')

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
