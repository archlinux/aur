# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpz'
pkgver='0.62'
pkgrel='1'
pkgdesc="Math::GMPz - perl interface to the GMP library's integer (mpz) functions."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'gmp>=6.1.0')
makedepends=('perl>=5.10.1' 'gmp>=6.1.0')
checkdepends=('perl-test-warn>=0.36')
url='https://metacpan.org/release/Math-GMPz'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-GMPz-$pkgver.tar.gz")
b2sums=('ac9bc22d6c3125827da8a7ff870044914fc0872d5735ba4564966a3e6edfc6a28f4de78d2f8e1f2793c0a37cf12701e5b0de734ca8a0036cf04f8b649c4a6bba')
_distdir="Math-GMPz-$pkgver"

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
