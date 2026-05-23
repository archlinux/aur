pkgname=hyprclock
pkgver=0.1.0a
pkgrel=1
pkgdesc="A clock utility made for the Hyprland window manager."
arch=('x86_64')
url="https://github.com/cvusmo/hyprclock"
license=('GPL-3.0-only')

depends=('gtk4' 'gstreamer' 'gst-plugins-base')
makedepends=('cargo')
conflicts=('hyprclock-bin' 'hyprclock-git' 'hyprclock-bin-debug' 'hyprclock-git-debug')

source=("https://github.com/cvusmo/hyprclock/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac8cf079251a0adaeec51d8da5a6d3b4246220da4f22237dbb908c5491f1e1dd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/hyprclock \
        "$pkgdir/usr/bin/hyprclock"
}
