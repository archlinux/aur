# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=randomgtk
_pkgname=random
pkgver=1.4
pkgrel=1
pkgdesc="A randomization app for GNOME"
arch=('x86_64')
url="https://codeberg.org/foreverxml/random"
license=('AGPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'gdk-pixbuf2')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('d32a5d00d52b3e339481e6f68f7209315aa03b4232b2a05d96163edc32db55577bda0c1660724ed4c776d81ced8136a809a93c17132b26e2fe4dfcc8a1f6d5b0')

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
