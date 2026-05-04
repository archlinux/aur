# Maintainer: Torikul Habib <torik.habib@gmail.com>
pkgname=gabutytb
pkgver=1.0.2
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
  'pkg-config'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabutakut/gabutytb/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ad6dd2b08188d5ca4bfa3c6612b29c8a1509c48cae400de97020c9fb654bff40')

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
