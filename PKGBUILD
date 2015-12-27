# Contributor: Trizen <trizenx@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpfr'
pkgver='3.28'
pkgrel='1'
pkgdesc="perl interface to the MPFR (floating point) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'gmp>=6.1.0' 'mpfr>=3.1.3.p4')
makedepends=()
url='https://metacpan.org/release/Math-MPFR'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SISYPHUS/Math-MPFR-3.28.tar.gz')
md5sums=('d6f9ffd2cce58a349ea541895eaef388')
sha512sums=('10dab17ed147fb1b430aeaf3814e93074b04cddd3de0bb3e7839de63bcf44befd98257436af3c75a3c72d463cda64291da2406b900219153d4a603e7051f009e')
_distdir="Math-MPFR-3.28"

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
