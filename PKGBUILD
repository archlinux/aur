# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util'
pkgver='0.73.git'
pkgrel='8'
pkgdesc="Math::Prime::Util - utilities related to prime numbers, including fast sieves and factoring (ntheory)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
    'glibc>=2.25'
    'perl>=5.6.2'
    'perl-math-prime-util-gmp>=0.52'
)
optdepends=(
    'perl-math-bigint-gmp: for faster BigInt operations.'
)
makedepends=()
_githash="51c7a4bb6cd9ab2e7d7a647a0b9dcf007c052183"
provides=(
    'perl-math-prime-util'
    'perl-math-prime-util-chacha'
    'perl-math-prime-util-ecaffinepoint'
    'perl-math-prime-util-ecprojectivepoint'
    'perl-math-prime-util-entropy'
    'perl-math-prime-util-memfree'
    'perl-math-prime-util-pp'
    'perl-math-prime-util-ppfe'
    'perl-math-prime-util-primalityproving'
    'perl-math-prime-util-primearray'
    'perl-math-prime-util-primeiterator'
    'perl-math-prime-util-randomprimes'
    'perl-math-prime-util-zetabigfloat'
    'perl-ntheory'
)
url='https://metacpan.org/release/Math-Prime-Util'
source=("https://github.com/danaj/Math-Prime-Util/archive/$_githash.zip")
b2sums=('20564736e7e93ca8c215c0f0e3782320482ab479675f6b95a52e5f978bc23465c66e2f972fb8606c4c851174edf80804e22dd2446843aefdc96b34e523b59133')
_distdir="Math-Prime-Util-$_githash"

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
