# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bigint-gmp'
pkgver='1.6012'
pkgrel='1'
pkgdesc="Math::BigInt::GMP - backend library for Math::BigInt etc. based on GMP"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gmp>=6.1.2' 'perl>=5.6.1' 'perl-math-bigint>=1.999838')
makedepends=()
url='https://metacpan.org/release/Math-BigInt-GMP'
source=("https://cpan.metacpan.org/authors/id/P/PJ/PJACKLAM/Math-BigInt-GMP-$pkgver.tar.gz")
b2sums=('5ff66bcabd76c756349fc84d7e5587d176e7b961e314268625ee6ab4921f774be8ebd0efef108636dc6bd36556a44f3442a8c89abbe19dc62fa36fcf6e7ed993')
_distdir="Math-BigInt-GMP-$pkgver"

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
