# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-date-ical'
pkgver='2.678'
pkgrel='1'
pkgdesc="Perl extension for ICalendar date objects."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-date-leapyear>=1.03')
makedepends=()
url='http://search.cpan.org/dist/Date-ICal'
source=('http://search.cpan.org/CPAN/authors/id/R/RB/RBOW/Date-ICal-2.678.tar.gz')
md5sums=('10a1d4ad6b941e91dd83748fefdbff5b')
sha512sums=('317d793ed058b8cc21090f681f44e19c91282ad29b7c3fd0c2d2ee1bce66244b402ada90ea8c63d4bd25f5c9a5f5984257cbe700cd1d852e799232e421b77fe4')
_distdir="Date-ICal-2.678"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
