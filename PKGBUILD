# Maintainer: Matthew Anderson <mpa.business@pm.me>

pkgname=obs-hyperate-plugin
pkgver=0.1.12
pkgrel=1
pkgdesc='OBS Studio plugin for real-time HypeRate heart rate sources and filters'
arch=('x86_64')
url='https://github.com/alexholzreiter/obs-hyperate-plugin'
license=('unknown') # check the repo's LICENSE file and update
depends=('obs-studio' 'libwebsockets')
makedepends=('cmake' 'ninja' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b8e3d2a087e5c5db5023f8c07a64c519efc4c77324c6e0a41bc4ebf8225c2d6')

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
