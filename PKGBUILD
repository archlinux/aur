# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=courier-unicode
pkgver=1.1
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
  'a10e61d20f3bf25bebdec495dea54258948f333a29f29a7f155a31f9bfb3f56c'
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
