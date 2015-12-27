# Contributor: Trizen <trizenx@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpc'
pkgver='1.04'
pkgrel='1'
pkgdesc="perl interface to the MPC (multi precision complex) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gmp>=6.1.0' 'libmpc>=1.0.3' 'mpfr>=3.1.3.p4' 'perl-math-mpfr>=3.23')
makedepends=()
url='https://metacpan.org/release/Math-MPC'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SISYPHUS/Math-MPC-1.04.tar.gz')
md5sums=('fb360ed81fcead8a3690d85b1853f7fb')
sha512sums=('3470d0045dbcfc50070fba9eee526633d62ca9491272b01a266a073e4f3a6689c2a48ab501d3be69b74c5f72dc6d5941632b3e3d662c2ea9a2ce49f006eed0ce')
_distdir="Math-MPC-1.04"

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
