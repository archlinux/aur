# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-math-basecnv'
pkgver='1.8'
pkgrel='1'
pkgdesc="fast functions to CoNVert between number Bases"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-pod>=0' 'perl-test-pod-coverage>=0')
url='http://search.cpan.org/dist/Math-BaseCnv'
source=('http://search.cpan.org/CPAN/authors/id/P/PI/PIP/Math-BaseCnv-1.8.B59BrZX.tgz')
md5sums=('0e8587eaec265c93542cc5eb40804bc0')
sha512sums=('4eee9c76c28e395796276f1530426e315cb69fad211045701296fac9883d081e37887d8fbe79c3886e65b17d068a8a5b172b434d2724dc476df6935cf1e1ce8c')
_distdir="Math-BaseCnv-1.8.B59BrZX"

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
