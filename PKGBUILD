# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=badabib
_pkgname=BadaBib
pkgver=0.7.2
pkgrel=1
pkgdesc="Bada Bib! is a simple BibTeX Viewer and Editor written in Python and GTK"
arch=('x86_64')
url="https://github.com/RogerCrocker/BadaBib"
license=('GPL3')
depends=('libadwaita' 'python-bibtexparser' 'python-watchgod')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('a13ebf959d7bc3f9a07e33b31a18d2f86f84da788efbdae72eccd0245de84a9b1ef06f4acc2389849eb22429e6d64f9a5b945e5b3ea2f7d69744ff6b83e5aab5')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
