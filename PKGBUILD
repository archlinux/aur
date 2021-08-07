# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vector-slicer
pkgver=0.0.2
pkgrel=1
pkgdesc="Export multi-page PDFs from an SVG"
arch=('any')
url="https://gitlab.gnome.org/World/design/vector-slicer"
license=('MIT')
depends=('glib2' 'gdk-pixbuf2' 'gtk3')
makedepends=('meson' 'rust')
source=(https://gitlab.gnome.org/World/design/vector-slicer/-/archive/v0.0.2/vector-slicer-v0.0.2.tar.gz)
md5sums=('SKIP') #autofill using updpkgsums

build() {
  arch-meson vector-slicer-v0.0.2 build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}