# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bignum'
pkgver='0.05'
pkgrel='1'
pkgdesc="Arbitrary size precision for integers, rationals and floating-point numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-multimethods' 'perl-math-gmpq>=0.39' 'perl-math-gmpz' 'perl-math-mpfr>=3.29')
makedepends=()
url='https://metacpan.org/release/Math-BigNum'
source=('http://search.cpan.org/CPAN/authors/id/T/TR/TRIZEN/Math-BigNum-0.05.tar.gz')
md5sums=('902cceede5bf7dda8fb63b6713e27c70')
sha512sums=('4a943b80f67c648a26f387ac71fadf8827391a8954ba68ac352969c81d308cb055ecbf0a79281a4b7367835c211f13b2b97db617a80a5502692f490a49d8adea')
_distdir="Math-BigNum-0.05"

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
