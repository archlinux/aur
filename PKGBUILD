# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util'
pkgver='0.60'
pkgrel='1'
pkgdesc="Utilities related to prime numbers, including fast sieves and factoring"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.24' 'perl>=5.6.2' 'perl-bytes-random-secure>=0.23')
optdepends=('perl-math-prime-util-gmp: the GMP backend for Math::Prime::Util (highly recommended)')
makedepends=()
provides=(
    'perl-math-prime-util'
    'perl-math-prime-util-ecaffinepoint'
    'perl-math-prime-util-ecprojectivepoint'
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
md5sums=('82eac034fb8d207485d35afcecbe6dd8')
sha512sums=('390121193b045fac5cb14225a785e06969e7851d86ab253cfab5cd77b50b172a5cde7747243830e5f513912a1b3519116716b668844d112af7237e7ab2c230c9')
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
