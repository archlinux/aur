# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=badabib
_pkgname=BadaBib
pkgver=0.1.1
pkgrel=1
pkgdesc="Bada Bib! is a simple BibTeX Viewer and Editor written in Python and GTK"
arch=('x86_64')
url="https://github.com/RogerCrocker/BadaBib"
license=('GPL3')
depends=('gtk3' 'glib2' 'python' 'python-bibtexparser' 'python-watchgod')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('c73233272a4588c7b469461a1c2fed3d1306404f609c2a481d70d4f46d4c34ad62bae63ab10be7e9556d701c5a9474b5153bd6e820f6b9943ef5dbbec1533a95')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
