# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=badabib
_pkgname=BadaBib
pkgver=0.8.0
pkgrel=1
pkgdesc="Bada Bib! is a simple BibTeX Viewer and Editor written in Python and GTK"
arch=('x86_64' 'aarch64')
url="https://github.com/RogerCrocker/BadaBib"
license=('GPL3')
depends=('libadwaita' 'python-bibtexparser' 'python-watchgod')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('666a4c79ea754fb3ff5e8de50df74570c69b4c051d3d1b89e47be5bf161998a24bb6649cd2bcd59b3c3ac01a8844b393f0b61c54d5b815be4419d3e45f892cf8')

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
