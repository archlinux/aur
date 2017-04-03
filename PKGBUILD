# Maintainer : Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-anynum'
pkgver='0.02'
pkgrel='1'
pkgdesc="Arbitrary size precision for integers, rationals, floating-points and complex numbers."
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-class-multimethods>=1.7' 'perl-math-gmpq>=0.41' 'perl-math-gmpz>=0.39' 'perl-math-mpc>=1.07' 'perl-math-mpfr>=3.29')
makedepends=()
url='https://metacpan.org/release/Math-AnyNum'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Math-AnyNum-${pkgver}.tar.gz")
md5sums=('1b49aec66b863227400b47bc3b271240')
sha512sums=('1a380baeae9224a7c968d74717081ec74620ffb11919d1292ba87b53540fccfc619b79a7c35329d8b544d12207dfa167802f62a46cdd7f95b3729fb3d96cd056')
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
