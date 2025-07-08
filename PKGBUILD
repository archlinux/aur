# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Archie <xMickael@ifrance.com>

pkgname=perl-image-metadata-jpeg
_perlmod=Image-MetaData-JPEG
_modnamespace=Image
pkgver=0.159
depends=('perl')
pkgrel=3
pkgdesc="Image::MetaData::JPEG - Perl extension for showing/modifying JPEG (meta)data."
arch=('any')
url="https://metacpan.org/dist/Image-MetaData-JPEG"
license=('GPL2')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('99dbb1d83dc0058787674650f896c532dd3efba40f139bf4e9699ad4e4b870fe557094689e478b158ff062e3f22f883806a45220211b6f8626ab9daffa650350')

build() {
  cd "${_perlmod}-${pkgver}"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${_perlmod}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${_perlmod}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
