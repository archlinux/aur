# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=junction
_pkgname=Junction
pkgver=1.2.0
pkgrel=1
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'gjs')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('129ef7a352fe201e3f0c553bd79aea5fd38cdb31c1562e3a9cf5e77ba5cb356f6448cd44856737853badaac0d32e224ba7af6f0d2e499b78f9c67f5b5a27ed5b')

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
