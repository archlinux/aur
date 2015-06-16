# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-math-matrix'
pkgver='0.7'
pkgrel='1'
pkgdesc="Multiply and invert Matrices"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Math-Matrix'
source=('http://search.cpan.org/CPAN/authors/id/U/UL/ULPFR/Math-Matrix-0.7.tar.gz')
md5sums=('3db21136213dbd8ce95997f14ba0cbf8')
sha512sums=('2d2add7964ab3822f2fbe09267a9ada365d22c35258ecf119985d00c02c6669ece679c6ecc84408a1d3fef4dc1e964946411f08096b3001d99b13a9a640b3576')
_distdir="Math-Matrix-0.7"

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
