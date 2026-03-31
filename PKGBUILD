# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpc'
pkgver='1.40'
pkgrel='1'
pkgdesc="Math::MPC - perl interface to the MPC (multi precision complex) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gmp>=6.1.0' 'libmpc>=1.3.0' 'mpfr>=3.1.3.p4' 'perl-math-mpfr>=4.14')
makedepends=('gmp>=6.1.0' 'libmpc>=1.3.0' 'mpfr>=3.1.3.p4' 'perl-math-mpfr>=4.14')
url='https://metacpan.org/release/Math-MPC'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-MPC-$pkgver.tar.gz")
b2sums=('ed2af52edd6c03f0d6ab8976679fed7c33a990d5baeb3e49800116c7c6e95f70a0d4b7ff887d88e285d1122e4e4e010d98b98e5b34f9ee57d1a514f86dd85163')
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
