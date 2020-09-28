# Maintainer: Jared Monger <info@jaredmonger.com>
pkgname=exiftool
_srcname=Image-ExifTool
pkgver=12.06
pkgrel=1
pkgdesc="Meta information reader/writer"
arch=('x86_64')
url="https://www.exiftool.org"
license=('PerlArtistic')
depends=('perl' 'sudo')
source=("${pkgname}-${pkgver}.tar.gz::https://exiftool.org/${_srcname}-${pkgver}.tar.gz")
sha1sums=('40217757c8f21733073f55fb58b520588fe28fee')

build() {
  cd "${_srcname}-${pkgver}"
  perl Makefile.PL
}

check() {
  cd "${_srcname}-${pkgver}"
  make test
}

package() {
  cd "${_srcname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
