# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-selenium-remote-driver'
pkgver='0.17'
pkgrel='1'
pkgdesc="Perl Client for Selenium Remote Driver"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message' 'perl-json' 'perl-libwww' 'perl-lwp-protocol-psgi')
makedepends=()
url='http://search.cpan.org/dist/Selenium-Remote-Driver'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHOWES/Selenium-Remote-Driver-0.17.tar.gz')
md5sums=('07869ccacba8db9b2954e7ec91db436d')
sha512sums=('b5d413adb33998efe3a1a521700d958ed87e49bea9f2ab41d635083a6402c5a56afdf2d03c9566297cea6e0c83a2add7af2fc331f78e0a07c2d3def6db4876f6')
_distdir="Selenium-Remote-Driver-0.17"

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
