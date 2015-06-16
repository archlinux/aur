# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetimex-duration-skipdays'
pkgver='0.002'
pkgrel='1'
pkgdesc="Given a starting date, a number of days and a list of days to be skipped, returns the date X number of days away."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-datetime' 'perl-datetime-event-holiday-us' 'perl-datetime-format-flexible' 'perl-list-moreutils' 'perl-try-tiny')
makedepends=('perl-test-checkdeps>=0.002' 'perl-test-deep' 'perl-test-nowarnings' 'perl-test-useallmodules')
url='http://search.cpan.org/dist/DateTimeX-Duration-SkipDays'
source=('http://search.cpan.org/CPAN/authors/id/A/AY/AYOUNG/DateTimeX-Duration-SkipDays-0.002.tar.gz')
md5sums=('2e2ed838ded0c4c4ad75853b651f7a9c')
sha512sums=('c1663d53fec6f5af69f21f312fa82d690984516726a221f8068c5ff49191ff7daf8bb93c97a9af4a4b775d2ee7b6be87af8f231ce0c39052dfafafc3ec9daa8c')
_distdir="DateTimeX-Duration-SkipDays-0.002"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
