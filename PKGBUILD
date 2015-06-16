# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-log-trace'
pkgver='1.070'
pkgrel='1'
pkgdesc="provides a unified approach to tracing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Log-Trace'
source=('http://search.cpan.org/CPAN/authors/id/B/BB/BBC/Log-Trace-1.070.tar.gz')
md5sums=('773aefa7539b1857edb3e225cfbc4a22')
sha512sums=('7368a4dc60cac263f6e1b783cd40f239fcee85af3ce5920148d9a83c4b129366c9d3e266656a53cbe5347571ba1b8f0c1bcd2488a4ca688a4d814a0d79e92039')
_distdir="Log-Trace-1.070"

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
