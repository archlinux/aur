# Maintainer : Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bignum'
pkgver='0.16'
pkgrel='1'
pkgdesc="Arbitrary size precision for integers, rationals and floating-point numbers."
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-class-multimethods' 'perl-math-gmpq>=0.41' 'perl-math-gmpz>=0.39' 'perl-math-mpfr>=3.29')
makedepends=()
url='https://metacpan.org/release/Math-BigNum'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Math-BigNum-${pkgver}.tar.gz")
md5sums=('90f93b30b9ae9ae85219a086ea369855')
sha512sums=('d40a6ce1c348bc35fbc2fc1d3b1e2c07ee0d65f0a0a1b52a802133b419c8ff7bf848e17f321dcef2705ab43fb4d472f05c86969088521a7b0fa05fa079378afe')
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
