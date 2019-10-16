# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bigint-gmp'
pkgver='1.6007'
pkgrel='1'
pkgdesc="Math::BigInt::GMP - backend library for Math::BigInt etc. based on GMP"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gmp>=6.1.2' 'perl>=5.6.1' 'perl-math-bigint>=1.999817')
makedepends=()
url='https://metacpan.org/release/Math-BigInt-GMP'
source=("https://cpan.metacpan.org/authors/id/P/PJ/PJACKLAM/Math-BigInt-GMP-$pkgver.tar.gz")
md5sums=('abc713279a17091a8043a7a6806ce8d4')
sha512sums=('cdeaeec1e450e95d761cefc63c5262c0b43cf5fc5865e62d0463e34821541c2b83d156979c1e7a8157c9747ccf5e3cefa80ac52489a7ce3186425bc27c176512')
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
