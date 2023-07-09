# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpfr'
pkgver='4.27'
pkgrel='1'
pkgdesc="Math::MPFR - perl interface to the MPFR (floating point) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'gmp>=6.1.1' 'mpfr>=3.1.4.p1')
makedepends=('perl' 'gmp>=6.1.1' 'mpfr>=3.1.4.p1')
url='https://metacpan.org/release/Math-MPFR'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-MPFR-$pkgver.tar.gz")
b2sums=('a6c9f5cad366228343be50207cabaeb75614e6cfba69d87a3bed81def61cbc850827073e511adb100c62ec5123ef99b99cf472ad6e5b8482b991ba0e0616ae9a')
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
