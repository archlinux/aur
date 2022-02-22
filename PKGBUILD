# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=randomgtk
_pkgname=random
pkgver=1.3
pkgrel=1
pkgdesc="A randomization app for GNOME"
arch=('x86_64')
url="https://codeberg.org/foreverxml/random"
license=('AGPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'gdk-pixbuf2')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('36946e2da6a7ed1dd0b56e02c20543f9ff717cd248b6b2ead65aa33f8791bc04702d7594d691e37ae7c44d3888d04b64c48997f66b75b1772c65c7561e6590d9')

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
