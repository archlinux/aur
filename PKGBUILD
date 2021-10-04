# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emulsion-palette
pkgver=2.0.5
pkgrel=1
pkgdesc="Store your palettes in an easy way, and edit them if needed"
arch=('any')
url="https://github.com/lainsce/emulsion"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'json-glib' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('138cf27ecf27bc633034513bf63dba46756e47beff6638352604db64c2b4de4ca058623cd685e5b6654442184bf95b44feda43bcd2afc318df0a85788eb841f4')

build() {
  arch-meson ${pkgname%-palette}-${pkgver} build
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" ninja install -C build
}
