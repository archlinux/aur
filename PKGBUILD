# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=random-gnome
_pkgname=random
pkgver=0.4
pkgrel=1
pkgdesc="A randomization app for GNOME"
arch=('x86_64')
url="https://codeberg.org/foreverxml/random"
license=('AGPL3')
depends=('glib2' 'gtk4' 'libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1c17b82986875852465ce73015d3f60fc1021cf973a4245d781b172e3daa780a')

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
