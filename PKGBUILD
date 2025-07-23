# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util'
pkgver='0.73.git'
pkgrel='9'
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
_githash="dc7dbc46bb41351528753c05dd0bae6b4e728a19"
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
b2sums=('916154022a8b5947079d5c79eea536901312da5d1810adc611a26dc18be09a71c85cf20d02d8babb054213a480880d53ae25a264f7592faa530deb58ad511ce2')
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
