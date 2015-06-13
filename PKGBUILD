# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-convert-nlsdateformat
pkgver=0.05
pkgrel="2"
pkgdesc="Convert Oracle NLS_DATE_FORMAT to/from strftime format strings"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Convert-NLS_DATE_FORMAT/"
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/K/KO/KOLIBRIE/Convert-NLS_DATE_FORMAT-${pkgver}.tar.gz)
md5sums=('ac2ba2b65b9002506d5e2ae87adecd04')

build() {
  cd ${srcdir}/Convert-NLS_DATE_FORMAT-${pkgver}

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd ${srcdir}/Convert-NLS_DATE_FORMAT-${pkgver}
  make install DESTDIR=${pkgdir}

  # remove perllocal.pod and .packlist
  find ${pkgdir} '(' -name perllocal.pod -o -name .packlist ')' -delete
}
