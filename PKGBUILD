# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=courier-unicode
pkgver=1.4
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
  '2174f4cdd2cd3fe554d4cbbd9557abac0e54c0226084f368bcb2e66b0e78cf96'
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
