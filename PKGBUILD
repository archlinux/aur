# Maintainer: Essem <smswessem@gmail.com>

pkgname=vipsdisp
pkgver=3.1.0
pkgrel=2
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
  'glib2-devel'
)
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('5c40e71c9c60232dcbf2e1c389295a4a102a27603bce994dbb2e35ff4f1844db')

build() {
  meson setup build $pkgname-$pkgver --prefix=/usr
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
