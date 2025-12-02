# Maintainer: Saeed Vaziry <sa.vaziry@gmail.com>
pkgname=archland-settings
pkgver=1.0.1
pkgrel=1
pkgdesc="Settings application for Archland"
arch=('any')
url="https://github.com/archland-linux/settings"
license=('MIT')
depends=(
    'gjs'
    'gtk4'
    'libadwaita'
)
makedepends=(
    'meson'
    'ninja'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('21f52af8a39a1ec26d65a6f0e47acbbfe14d9c3c19a82298bf331a9f30e03a14')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"
    meson install -C build --destdir "$pkgdir"
}
