# Maintainer: Torikul Habib <torik.habib@gmail.com>
pkgname=gabutytb
pkgver=1.0.1
pkgrel=1
pkgdesc="Frontend of YT-DLP built with GTK4 for Gabut Download Manager"
arch=('x86_64')
url="https://github.com/gabutakut/gabutytb"
license=('LGPL2.1')
depends=(
  'python3'
  'gtk4'
)
makedepends=(
  'meson'
  'ninja'
  'vala'
  'pkg-config'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabutakut/gabutytb/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3371286b8e885dea0c1f828833d552ead25cf02a223f46d68097838cb1ce748f')

build() {
  cd "$pkgname-$pkgver"
  meson setup build \
    --prefix=/usr \
    --buildtype=release
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install
}
