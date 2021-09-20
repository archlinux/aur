# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpc'
pkgver='1.13'
pkgrel='1'
pkgdesc="Math::MPC - perl interface to the MPC (multi precision complex) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gmp>=6.1.0' 'libmpc>=1.0.3' 'mpfr>=3.1.3.p4' 'perl-math-mpfr>=4.14')
makedepends=('gmp>=6.1.0' 'libmpc>=1.0.3' 'mpfr>=3.1.3.p4' 'perl-math-mpfr>=4.14')
url='https://metacpan.org/release/Math-MPC'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-MPC-$pkgver.tar.gz")
sha512sums=('351c00d66c72b6f3427ddd68bf726b3d1ef75cc73e7f566eb842f5c629c36852886cc77fe97867d91fa81b6810173d47afe617086bd9f6d419ac4f3c4b3f18a3')
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
