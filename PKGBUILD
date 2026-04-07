# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpz'
pkgver='0.69'
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
b2sums=('cd7bcbcaec27af21da4cd7224492ae9f7c48096f12c11518dd777daef0c50f3bb8f41c2e1fb452e5a91f5ec04fab327b82da24fb8862bafdf5dac4ed6c720e43')
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
