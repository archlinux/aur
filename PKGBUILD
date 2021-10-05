# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpz'
pkgver='0.51'
pkgrel='1'
pkgdesc="Math::GMPz - perl interface to the GMP library's integer (mpz) functions."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'gmp>=6.1.0')
makedepends=('perl>=5.10.1' 'gmp>=6.1.0')
checkdepends=('perl-test-warn')
url='https://metacpan.org/release/Math-GMPz'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-GMPz-$pkgver.tar.gz")
sha512sums=('5a93c406934b18426905426855aa4398da80a67e160572345760143ef99e8ddd4b022abe2abc9a52b27f33bee78b7574c26b2327b69bd91a4cb289d4272e04eb')
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
