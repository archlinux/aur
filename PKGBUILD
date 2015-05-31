# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=perl-date-holidayparser
pkgver=0.41
pkgrel=3
pkgdesc="Parser for .holiday-files"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Date-HolidayParser/"
license=('PerlArtistic' 'GPL')
source=(
  "http://search.cpan.org/CPAN/authors/id/Z/ZE/ZERODOGG/Date-HolidayParser-${pkgver}.tar.gz"
)
sha256sums=(
  'ec38a54a4029ca3796d3e9a46a231603911f51133e3a8203c6b71588c527d17c'
)
options=(!emptydirs)
makedepends=('perl-extutils-makemaker')
depends=('perl-any-moose')

build() {
  cd "${srcdir}/Date-HolidayParser-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/Date-HolidayParser-${pkgver}"
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
