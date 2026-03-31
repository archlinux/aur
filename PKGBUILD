# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpq'
pkgver='0.69'
pkgrel='1'
pkgdesc="Math::GMPq - perl interface to the GMP library's rational (mpq) functions."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'gmp>=6.1.0')
makedepends=()
url='https://metacpan.org/release/Math-GMPq'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-GMPq-$pkgver.tar.gz")
b2sums=('a644250795ebdffc4024d3d022b491da6706c144dd50ef43478ae6c28497b5f57d793c07f63423e79a20d447823e3c4c3d04633adbb492c822b5df9761e1d679')
_distdir="Math-GMPq-$pkgver"

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
