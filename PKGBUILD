# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-anynum'
pkgver='0.35'
pkgrel='1'
pkgdesc="Math::AnyNum - arbitrary size precision for integers, rationals, floating-points and complex numbers."
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-math-gmpq>=0.45' 'perl-math-gmpz>=0.39' 'perl-math-mpc>=1.07' 'perl-math-mpfr>=3.29')
makedepends=()
url='https://metacpan.org/release/Math-AnyNum'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Math-AnyNum-${pkgver}.tar.gz")
md5sums=('0533a4c50f0ab86d5db4cf44b1b5ffba')
sha512sums=('4aeb63f0817e9790ddae72dd904ab73c06bb5af28ec1410c33cbf709ab8b345a9e1fb7b2727db4c82b892f5de789dcbb9b48238d34b823ca1339b160599cd320')
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
  rm -r "$pkgdir/usr/lib"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
