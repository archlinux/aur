# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bigint'
pkgver='1.999836'
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
b2sums=('733bb517100d935a1196fd8ce64bf838ea52c4812b3e44a0e3f1a52bcce6aa28420ae434b4944141538d814981130cfb7e131918577f284e8597ac2cb2f33748')
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
