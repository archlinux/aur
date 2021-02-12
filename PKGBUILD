# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpfr'
pkgver='4.16'
pkgrel='1'
pkgdesc="Math::MPFR - perl interface to the MPFR (floating point) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'gmp>=6.1.1' 'mpfr>=3.1.4.p1')
makedepends=('perl' 'gmp>=6.1.1' 'mpfr>=3.1.4.p1')
url='https://metacpan.org/release/Math-MPFR'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-MPFR-$pkgver.tar.gz")
md5sums=('a8522ce0657ee7822edfdfa4000f5231')
sha512sums=('9c153452e5b315c0f22587622cbdc08a441f37871c127791fc15b7d720982c6e86555350e97cbf51b27264df7de678979a1dc1c65ef8c16df3de82f594e6f403')
_distdir="Math-MPFR-$pkgver"

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
