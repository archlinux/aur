# Maintainer: Robert Knauer <robert@capsaicin-dev.de>

pkgname=courier-unicode
pkgver=2.0
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
  '6b46011d465918af7d0ed41fbf21d918449820bd3ef7e651dbc56eb2933a8711'
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
