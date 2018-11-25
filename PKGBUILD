# Maintainer: Ainola
# Contributor: Adam Brunnmeier

pkgname=wl-clipboard
pkgver=1.0.0
pkgrel=2
pkgdesc="Command-line copy/paste utilities for Wayland"
arch=('x86_64')
url="https://github.com/bugaevc/wl-clipboard"
license=('GPL3')
depends=('wayland')
optdepends=(
    'xdg-utils: for content type inference in wl-copy'
    'mailcap: for type inference in wl-paste'
)
makedepends=('meson' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bugaevc/wl-clipboard/archive/v1.0.0.tar.gz")
sha256sums=('9b5c1f5f67c40672324194ec11c1fcbeccc72c0cd5b6712d6c7257be252387e3')

build() {
    arch-meson "$pkgname-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
