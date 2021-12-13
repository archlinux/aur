# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=junction
_pkgname=Junction
pkgver=1.3.0
pkgrel=1
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'gjs')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('c3fe832e68871c9673d4bbb8b816d1ebbc75a8da9d739996eb324033fa4081f72b9793fcc8807d1f4b435da349798560a3642bbf0d4a59eb311e5553c19e36d1')

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
