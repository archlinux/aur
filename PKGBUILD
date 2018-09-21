# Maintainer: Robert Knauer <robert@capsaicin-dev.de>

pkgname=courier-unicode
pkgver=2.1
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
  '684cba7fe722b084ae1ffb0a7f71999756409d5ad4c84bce0efeb8887943ea21'
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
