# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpc'
pkgver='1.15'
pkgrel='1'
pkgdesc="Math::MPC - perl interface to the MPC (multi precision complex) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gmp>=6.1.0' 'libmpc>=1.0.3' 'mpfr>=3.1.3.p4' 'perl-math-mpfr>=4.14')
makedepends=('gmp>=6.1.0' 'libmpc>=1.0.3' 'mpfr>=3.1.3.p4' 'perl-math-mpfr>=4.14')
url='https://metacpan.org/release/Math-MPC'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-MPC-$pkgver.tar.gz")
b2sums=('b00cb58596383c14f72835390a66524a9a66de0fa8d3bb7e1860297627b84f40a78a9efb4c04526fb423256c2180901eff13577b9c3311ca6a079255a7c54a29')
_distdir="Math-MPC-${pkgver}"

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
