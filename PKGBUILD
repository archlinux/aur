# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=junction
_pkgname=Junction
pkgver=1.5.0
pkgrel=1
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'gjs')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('390ea7db13d7642f66b8ff1179bc3822808aa73642f8391a16a5909428e01e51bfdcd8604f562c91c07cac95e6f365b09b452394a89bc6c8c50f7ab437df3273')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
