# Maintainer: Saeed Vaziry <sa.vaziry@gmail.com>
pkgname=archland-settings
pkgver=1.0.2
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
sha256sums=('9082169e402b3fbb3fa9cdcf512e37bc96757e57767957e7b37cffbeede92fe2')

build() {
    cd "settings-$pkgver"
    arch-meson build
    meson compile -C build
}

package() {
    cd "settings-$pkgver"
    meson install -C build --destdir "$pkgdir"
}
