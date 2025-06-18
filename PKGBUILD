# Maintainer: Essem <smswessem@gmail.com>

pkgname=vipsdisp
pkgver=4.0.0
pkgrel=1
pkgdesc="Tiny libvips / gtk+4 image viewer"
arch=('x86_64')
url="https://github.com/jcupitt/vipsdisp"
license=('MIT')
depends=(
  'cairo'
  'dconf'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'libvips'
)
makedepends=(
  'meson'
  'cmake'
  'glib2-devel'
)
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('7bbb6740b13d0b211af2efab83d3a0d6e4646b15f57a038ac44ad67f446c5b64')

build() {
  meson setup build $pkgname-$pkgver --prefix=/usr
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
