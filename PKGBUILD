# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bigint-gmp'
pkgver='1.6010'
pkgrel='1'
pkgdesc="Math::BigInt::GMP - backend library for Math::BigInt etc. based on GMP"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gmp>=6.1.2' 'perl>=5.6.1' 'perl-math-bigint>=1.999819')
makedepends=()
url='https://metacpan.org/release/Math-BigInt-GMP'
source=("https://cpan.metacpan.org/authors/id/P/PJ/PJACKLAM/Math-BigInt-GMP-$pkgver.tar.gz")
b2sums=('22e79d167e8d8fb3a34685488550860bd81e225166fd22be9353ce12a871a486b0b0d01fa72a32f063133d4c2f6bc9aeef1207865824a4de7679e80a137638f6')
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
