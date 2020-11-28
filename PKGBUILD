# Maintainer: Jared Monger <info@jaredmonger.com>
pkgname=exiftool
_srcname=Image-ExifTool
pkgver=12.11
pkgrel=1
pkgdesc="Meta information reader/writer"
arch=('x86_64')
url="https://www.exiftool.org"
license=('PerlArtistic')
depends=('perl')
conflicts=('perl-image-exiftool')
source=("${pkgname}-${pkgver}.tar.gz::https://exiftool.org/${_srcname}-${pkgver}.tar.gz")
sha1sums=('cd75e0ec751dc408e98dbc45af543e03376c50c5')

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
