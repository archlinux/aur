# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-calendarmonthsimple'
pkgver='1.25'
pkgrel='1'
pkgdesc="Perl Module for Generating HTML Calendars"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-date-calc')
makedepends=()
url='http://search.cpan.org/dist/HTML-CalendarMonthSimple'
source=('http://search.cpan.org/CPAN/authors/id/S/ST/STIGMATA/HTML-CalendarMonthSimple-1.25.tar.gz')
md5sums=('2f9fcad2627890cc11ab5c3cd3c986cf')
sha512sums=('d06e397637761d761b1ba94b3725002ce6975197396f72394c9ef9f74de4023affacba6603ac3ec4dd6c92092ac3d701abd11c7e7dc4ada7eb9c8cdfa54f2ce6')
_distdir="HTML-CalendarMonthSimple-1.25"

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
