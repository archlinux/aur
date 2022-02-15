# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-text-vcardfast
pkgver=0.11
pkgrel=1
pkgdesc="Perl extension for very fast parsing of VCards"
arch=('x86_64')
url="https://metacpan.org/dist/Text-VCardFast"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-json-xs')
source=("https://www.cpan.org/modules/by-module/Text/Text-VCardFast-${pkgver}.tar.gz")
sha512sums=('412d311cc36132166c8073cd72ea6b4591022e280a0b7efb87f72b2612d42f574d8ab523c30727c3e9332775e0ff850d4731b7b7de7e273fc738c0ac021bb3ad')

build() {
  cd "${srcdir}/Text-VCardFast-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Text-VCardFast-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Text-VCardFast-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
