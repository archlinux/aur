# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-math-basearith'
pkgver='1.00'
pkgrel='1'
pkgdesc="Perl extension for mixed-base number representation (like APL encode/decode)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Math-BaseArith'
source=('http://search.cpan.org/CPAN/authors/id/P/PU/PUCKERING/Math-BaseArith-1.00.tar.gz')
md5sums=('4fb5ba50af1e8d83e0d442d4b950703c')
sha512sums=('9be769fe8dbc3399764fad5d680a7aea51080e5927914034f62fdfd3852559f185e9a5d025c1c950f8c8b45c248be3973b4a4824b7272c087a1b24a465340252')
_distdir="Math-BaseArith-1.00"

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
