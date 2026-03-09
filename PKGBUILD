# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpfr'
pkgver='4.46'
pkgrel='1'
pkgdesc="Math::MPFR - perl interface to the MPFR (floating point) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'gmp>=6.1.1' 'mpfr>=3.1.4.p1')
makedepends=('perl' 'gmp>=6.1.1' 'mpfr>=3.1.4.p1')
url='https://metacpan.org/release/Math-MPFR'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-MPFR-$pkgver.tar.gz")
b2sums=('5ac831e23b853e977bd24d4c6a60656f44a9409e7eae3b131247cf1cd9a58020f401c971b65b54259c640a5f830fa66e373fd0c4b0fe9a1adafe6aa68c7f2b1d')
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
