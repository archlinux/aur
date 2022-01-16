# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=badabib
_pkgname=BadaBib
pkgver=0.4.1
pkgrel=1
pkgdesc="Bada Bib! is a simple BibTeX Viewer and Editor written in Python and GTK"
arch=('x86_64')
url="https://github.com/RogerCrocker/BadaBib"
license=('GPL3')
depends=('gtk3' 'glib2' 'python' 'python-bibtexparser' 'python-watchgod')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('3e9081db5f6c3786c5aecc6806c1ab748d0c5394116915afd7e40f7d26ae69f9be20999d6581e863be8bc2fba80c0c0ff1f1a4f63f9c6c1b216882325aa6fc1b')

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
