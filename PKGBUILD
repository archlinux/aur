# Maintainer: Essem <smswessem@gmail.com>

pkgname=nip4
pkgver=9.0.10
pkgrel=1
pkgdesc="image processing spreadsheet"
arch=('x86_64')
url="https://github.com/jcupitt/nip4"
license=('MIT')
depends=(
  'cairo'
  'dconf'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'gsl'
  'gtk4'
  'hicolor-icon-theme'
  'libvips'
  'libxml2'
  'pango'
)
makedepends=(
  'meson'
  'cmake'
  'glib2-devel'
)
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('0e50978c042ff6a333fb9ca35ef0ebf6afbf0db43cbc5e122f2ab85cd6343c60')

build() {
  meson setup build $pkgname-$pkgver --prefix=/usr
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
