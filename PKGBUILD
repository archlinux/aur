# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-plack-middleware-consolelogger'
pkgver='0.04'
pkgrel='1'
pkgdesc="Write logs to Firebug or Webkit Inspector"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-javascript-value-escape' 'perl-plack>=0.99')
makedepends=('perl-test-requires')
url='http://search.cpan.org/dist/Plack-Middleware-ConsoleLogger'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-Middleware-ConsoleLogger-0.04.tar.gz')
md5sums=('849e47d0a3fc832563e7c7d4026ab6fd')
sha512sums=('b559b12a920189029f9e467d4a82aca8abee14bd6662b6586aaafa056133a49cbaf0ad79935ac74746025f39b33856b38ddc2fdec86ad67815d88090fe8cbaab')
_distdir="Plack-Middleware-ConsoleLogger-0.04"

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
