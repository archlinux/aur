# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-data-ical-timezone
pkgver=1.23
pkgrel=1
pkgdesc="Timezones for Data::ICal"
arch=('any')
url="https://metacpan.org/dist/Data-ICal-TimeZone"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-class-accessor' 'perl-class-returnvalue'
         'perl-class-singleton' 'perl-data-ical' 'perl-universal-require')
source=("https://www.cpan.org/modules/by-module/Data/Data-ICal-TimeZone-${pkgver}.tar.gz")
sha512sums=('000d295b839c43c1a80c4c5eb48fad003b1b204690e870e0e90565bdfdd7f4949ed0a4fca86bbe5bf201a292d55c15171cebdfc7ab2f8f5b9b2fdde888c9ef5e')

build() {
  cd "${srcdir}/Data-ICal-TimeZone-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Data-ICal-TimeZone-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Data-ICal-TimeZone-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
