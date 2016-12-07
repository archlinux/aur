# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpc'
pkgver='1.07'
pkgrel='1'
pkgdesc="perl interface to the MPC (multi precision complex) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gmp>=6.1.0' 'libmpc>=1.0.3' 'mpfr>=3.1.3.p4' 'perl-math-mpfr>=3.23')
makedepends=()
url='https://metacpan.org/release/Math-MPC'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-MPC-$pkgver.tar.gz")
md5sums=('081cc3c3321213f15713395b9df8d7e5')
sha512sums=('df5a69d6ab93416d369c64db2886dbe4bb04946086de8b4216b132f9b6c7d55d1fd211161b8af4c4fa564775c7d3b67feec45ad793c448967b5cf4028ce50987')
_distdir="Math-MPC-${pkgver}"

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
