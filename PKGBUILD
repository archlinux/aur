# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bigint'
pkgver='1.999831'
pkgrel='1'
pkgdesc="Math::BigInt - Arbitrary size integer/float math package"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
provides=('perl-math-bigfloat' 'perl-math-bigint-calc' 'perl-math-bigint-lib')

url='https://metacpan.org/release/Math-BigInt'
source=("https://cpan.metacpan.org/authors/id/P/PJ/PJACKLAM/Math-BigInt-$pkgver.tar.gz")
b2sums=('a66677684dc9d2f5cb3273b17e916e6648a75c8a7aa4099965fa6834738131135a7d6752b1a7e440af10651f0e8ca278e5a9b8495d584a28159a74db7b3b97b6')
_distdir="Math-BigInt-$pkgver"

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
