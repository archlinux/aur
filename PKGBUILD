# Maintainer: Saeed Vaziry <sa.vaziry@gmail.com>
pkgname=archland-settings
pkgver=1.0.3
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
sha256sums=('45092ca4d8c80080a817ca5d36cce45d8627f10510a8d83f3823ce677f05dec1')

build() {
    cd "settings-$pkgver"
    arch-meson build
    meson compile -C build
}

package() {
    cd "settings-$pkgver"
    meson install -C build --destdir "$pkgdir"
}
