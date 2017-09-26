# Maintainer : Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-anynum'
pkgver='0.14'
pkgrel='1'
pkgdesc="Arbitrary size precision for integers, rationals, floating-points and complex numbers."
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-math-gmpq>=0.45' 'perl-math-gmpz>=0.39' 'perl-math-mpc>=1.07' 'perl-math-mpfr>=3.29')
makedepends=()
url='https://metacpan.org/release/Math-AnyNum'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Math-AnyNum-${pkgver}.tar.gz")
md5sums=('0cd232106040feaa7ef96400a2160167')
sha512sums=('4a53f26aaca46eb115c939f29d46b75c702087aa256f6b03a66be2d007f533af969663ac9fe33618f06c0b078d9aeb600bd7c722a859de944f7254184a4c2ab8')
_distdir="Math-AnyNum-${pkgver}"

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
