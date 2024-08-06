# Maintainer: Neil Romig <neilromig@gmail.com>
# Contributor: Robert Knauer <robert@capsaicin-dev.de>

pkgname=courier-unicode
pkgver=2.3.1
pkgrel=1
pkgdesc="Courier Unicode Library"
arch=("i686" "x86_64" "aarch64")
url="http://www.courier-mta.org/unicode/"
license=('GPL3')
depends=('gcc-libs')
options=(!debug)
source=(
  "https://sourceforge.net/projects/courier/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
)
sha256sums=(
  'b83ee646a47c2a9d692fb6efb938564668c32ec179d4fac0c07eace8a1b8fc91'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
