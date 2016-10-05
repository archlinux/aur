# Maintainer : Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bignum'
pkgver='0.12'
pkgrel='1'
pkgdesc="Arbitrary size precision for integers, rationals and floating-point numbers."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-multimethods' 'perl-math-gmpq>=0.41' 'perl-math-gmpz>=0.39' 'perl-math-mpfr>=3.29')
makedepends=()
url='https://metacpan.org/release/Math-BigNum'
source=("http://search.cpan.org/CPAN/authors/id/T/TR/TRIZEN/Math-BigNum-${pkgver}.tar.gz")
md5sums=('8e43902ae87e89a6501b1fbe81b7c9ed')
sha512sums=('b91264d0578c02c3f401496823d82e0e399a02533ff0b67fc4818a2483541bca7f55443856be30cd60100e7145216b453884771b9f22702adff776b02377b67e')
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
