# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=swatch
pkgver=1.0
pkgrel=1
pkgdesc="Color palette manager"
arch=('any')
url="https://gitlab.gnome.org/GabMus/swatch"
license=('GPL3')
depends=('glib2' 'libadwaita')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('a3db665127fa75f38d0cdca27ffa214efaec5651db3a412b20f6d98187c8b63d180cad7d918e601be6fae9569246ac077ebeb968f20ffb1c249786856e5b1eec')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
