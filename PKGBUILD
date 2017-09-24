# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util'
pkgver='0.67'
pkgrel='1'
pkgdesc="Utilities related to prime numbers, including fast sieves and factoring"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
    'glibc>=2.25'
    'perl>=5.6.2'
    'perl-math-prime-util-gmp>=0.46'
)
optdepends=(
    'perl-math-mpfr: for faster Ei, Li, Zeta and R functions.'
    'perl-math-bigint-gmp: for faster BigInt operations.'
)
makedepends=()
provides=(
    'perl-math-prime-util'
    'perl-math-prime-util-chacha'
    'perl-math-prime-util-ecaffinepoint'
    'perl-math-prime-util-ecprojectivepoint'
    'perl-math-prime-util-entropy'
    'perl-math-prime-util-isaac'
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
source=("https://cpan.metacpan.org/authors/id/D/DA/DANAJ/Math-Prime-Util-$pkgver.tar.gz")
md5sums=('6de3cc1db40e95171de513642399edeb')
sha512sums=('0be38e6edb2d878103e0570eeb40430527b9389676d7e861889f42b235668be67c19019fe6c756087100110fb8c40c87b0440ea5d04079c8d14db38448c9e39d')
_distdir="Math-Prime-Util-$pkgver"

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
