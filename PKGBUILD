# Contributor: clu@eeviac

pkgname=perl-text-unidecode
pkgver=1.30
pkgrel=1
pkgdesc="US-ASCII transliterations of Unicode text"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Text-Unidecode"
license=('Unknown')
depends=('perl>=5.6.0')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SB/SBURKE/Text-Unidecode-${pkgver}.tar.gz)
sha1sums=('13c28520896a0073e0ea9333a2b6b770dcf17d6e')

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
