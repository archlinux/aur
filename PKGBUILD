# Maintainer: Neil Romig <neilromig@gmail.com>
# Contributor: Robert Knauer <robert@capsaicin-dev.de>

pkgname=courier-unicode
pkgver=2.6.0
pkgrel=1
pkgdesc="Courier Unicode Library"
arch=("i686" "x86_64" "aarch64")
url="http://www.courier-mta.org/unicode/"
license=('GPL3')
depends=('gcc-libs>=10.0.0')
options=(!debug)
source=(
  "https://sourceforge.net/projects/courier/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
)
sha256sums=(
  '0aed2349c5b62de0d33ccf8c23527aae41daf95a03c8054c88de4faef8da8a08'
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
