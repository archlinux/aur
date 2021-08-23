# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=master-key
pkgver=1.2.0
pkgrel=1
pkgdesc="Master Key is a password manager application built with Python 3 and GTK that generates and manages passwords without the need to store them"
arch=('any')
url="https://gitlab.com/guillermop/master-key/"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita' 'sassc' 'libsass' 'python' 'python-gobject' 'libpwquality' 'sqlcipher' 'tcl')
makedepends=('meson' 'gobject-introspection')
source=(https://gitlab.com/guillermop/master-key/-/archive/v1.2.0/master-key-v1.2.0.tar.gz)
sha256sums=('ca823e34d6eb381cb65c689bbaf90449345ac3771ee10395ebb8a17383d05e22')

build() {
  arch-meson "${pkgname%-git}-v$pkgver" _build
  meson compile -C _build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" ninja install -C _build
}





