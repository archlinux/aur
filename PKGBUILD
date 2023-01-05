# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=wio-wl
pkgver=0.16.1
pkgrel=1
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('custom')
depends=(alacritty cage cairo wlroots)
makedepends=(meson)
source=("$url/-/archive/$pkgver/wio-$pkgver.tar.gz")
b2sums=('a335fd716afb722b14dfa06034c6fb01ec49dfa0e0e124d75230d1fbdce9b1fb9015e241cd2074850c719e395e9780a188cd919f04b37e91aa1a37432c909c80')

build() {
    cd wio-$pkgver
    arch-meson build
    meson compile -C build
}

package() {
    cd wio-$pkgver
    meson install -C build --destdir "$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
