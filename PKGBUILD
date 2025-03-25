# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-datetimex-easy'
pkgver='0.092'
pkgrel='1'
pkgdesc="Parse a date/time string using the best method available"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0' 'perl-datetime-format-datemanip>=0' 'perl-datetime-format-flexible>=0' 'perl-datetime-format-ical>=0' 'perl-datetime-format-natural>=0' 'perl-datetime-timezone>=2.63' 'perl-timedate>=0' 'perl-yaml>=0')
makedepends=()
checkdepends=('perl-test-most>=0')
url='https://metacpan.org/release/DateTimeX-Easy'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/DateTimeX-Easy-0.092.tar.gz')
md5sums=('b810929f8323259569a7678bbb170c9e')
sha512sums=('c04995b981d73c449c63005e7c30ac537eaea8f12b99972a9df40d53fcf96362b9bbc588f9c3b450cfa2c4a0a1b6ccbbea0f48cbfc65ad377d357c4d9be5f354')
_distdir="DateTimeX-Easy-0.092"

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
