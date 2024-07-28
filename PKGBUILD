# Maintainer: Essem <smswessem@gmail.com>

pkgname=vipsdisp
pkgver=2.6.3
pkgrel=1
pkgdesc="Tiny libvips / gtk+4 image viewer"
arch=('x86_64')
url="https://github.com/jcupitt/vipsdisp"
license=('MIT')
depends=(
  'libvips'
  'gtk4'
)
makedepends=(
  'meson'
  'cmake'
)
#source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
#sha256sums=('f845fa7361bda85ac31900e7a56f26d5312233bcae8ce8b04b8ac08a668d48d5')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('5a2206a7147542311e5f37bdc1f1e331b11bd24045e65a056015e807560d272e')

build() {
  meson setup build $pkgname-$pkgver --prefix=/usr
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
