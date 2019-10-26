# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bigint'
pkgver='1.999818'
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
md5sums=('a6e5a6c391b453e04c2b60506e1b5342')
sha512sums=('75234eab0ec99a7412a25cf5c60543f1ea0aa35107e4fca49d80871e5d055c4820968a0ee4fe0ff48dd73b8ca122864b5d26964a932a9cc7b296a1356fac7966')
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
