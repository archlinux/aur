# Contributor: clu@eeviac

pkgname=perl-text-unidecode
pkgver=0.04
pkgrel=2
pkgdesc="US-ASCII transliterations of Unicode text"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Text-Unidecode"
license=('Unknown')
depends=('perl>=5.6.0')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SB/SBURKE/Text-Unidecode-${pkgver}.tar.gz)
sha1sums=('baf3e2f90011e25fb10cb4d47ade53cc3977b3af')

build() {
  cd  ${srcdir}/Text-Unidecode-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  ${srcdir}/Text-Unidecode-${pkgver}
  make install DESTDIR=${pkgdir}
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
