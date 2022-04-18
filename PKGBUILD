# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=chirurgien
_pkgname=Chirurgien
pkgver=2.1
pkgrel=1
pkgdesc="Chirurgien helps understand and manipulate file formats"
arch=('x86_64')
url="https://github.com/leonardschardijn/Chirurgien"
license=('GPL3')
depends=('gtk4' 'glib2')
makedepends=('meson')
checkdepends=('appstream-glib')
source=(${url}/archive/v${pkgver}.tar.gz)
b2sums=('f1d57ae5daab9c196ab87632f7894dab1cbca231de2794501a33157cf0b9175e2be172c903a093cc08b0a8948ba7e847d2cb259b9857a0c1598fb15c9caff3d7')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
