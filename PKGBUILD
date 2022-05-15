# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=badabib
_pkgname=BadaBib
pkgver=0.7.1
pkgrel=1
pkgdesc="Bada Bib! is a simple BibTeX Viewer and Editor written in Python and GTK"
arch=('x86_64')
url="https://github.com/RogerCrocker/BadaBib"
license=('GPL3')
depends=('gtk4' 'glib2' 'python' 'python-bibtexparser' 'python-watchgod')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('1a2db406263543e0296fcb0675bf6dd7e0bb991d15b3ddf992d0e937e71f463ff04cc657bcba7777b5b1726ab2abbfa0aabb789cf8caa2970c61e331a9793a51')

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
