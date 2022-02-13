# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=badabib
_pkgname=BadaBib
pkgver=0.5.0
pkgrel=1
pkgdesc="Bada Bib! is a simple BibTeX Viewer and Editor written in Python and GTK"
arch=('x86_64')
url="https://github.com/RogerCrocker/BadaBib"
license=('GPL3')
depends=('gtk4' 'glib2' 'python' 'python-bibtexparser' 'python-watchgod')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('7b5ff8e48b09f51cd28d91ba81668ab8fd1fe21fcf00e06b83c32189f5262c228d45c8cab9627c3b81b5db5286356f8095bef9d5c35d65db1d1da2850b893d1a')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
