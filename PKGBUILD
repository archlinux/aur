# Maintainer: Neil Romig <neilromig@gmail.com>
# Contributor: Robert Knauer <robert@capsaicin-dev.de>

pkgname=courier-unicode
pkgver=2.3.2
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
  'b645d2f00aabbc682320ede696ca50201266f710a1bcec4ac5042695c99e7f69'
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
