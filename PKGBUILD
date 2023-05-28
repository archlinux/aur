# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=wio-wl
pkgver=0.16.2
pkgrel=1
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('custom')
depends=(alacritty cage cairo wlroots)
makedepends=(meson)
source=("$url/-/archive/$pkgver/wio-$pkgver.tar.gz")
b2sums=('725a180244360c84fbe81729158351eabef0c562039e6c90a890d3aee6d3b17376c00abf7dcf596a83e8781a2c8481ebd50f15454a8f69f7bb4e40a19fd8fe31')

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
