# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=courier-unicode
pkgver=1.3
pkgrel=1
pkgdesc="Courier Unicode Library"
arch=("i686" "x86_64")
url="http://www.courier-mta.org/unicode/"
license=('GPL3')
depends=('gcc-libs')
source=(
  "https://sourceforge.net/projects/courier/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
)
sha256sums=(
  '8067d2fec621af1a463b690b325c700920f98e1271052354abfd4c8ca82f7e68'
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
