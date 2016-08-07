# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bignum'
pkgver='0.07'
pkgrel='1'
pkgdesc="Arbitrary size precision for integers, rationals and floating-point numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-multimethods' 'perl-math-gmpq>=0.39' 'perl-math-gmpz' 'perl-math-mpfr>=3.29')
makedepends=()
url='https://metacpan.org/release/Math-BigNum'
source=("http://search.cpan.org/CPAN/authors/id/T/TR/TRIZEN/Math-BigNum-${pkgver}.tar.gz")
md5sums=('f49dd046e0563c85b6f5b3a2f0c70916')
sha512sums=('b73c27a2786d0ae0b84ab8232818c3f0d7b3612278b9d1317ffcca02c7f112f8797636ef288c19d78e6a89786a8bd0b858a02e33bb1365fef1f7c1c6255cb17d')
_distdir="Math-BigNum-${pkgver}"

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
