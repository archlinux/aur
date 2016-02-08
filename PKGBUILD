# Contributor: Trizen <trizenx@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpfr'
pkgver='3.30'
pkgrel='1'
pkgdesc="perl interface to the MPFR (floating point) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'gmp>=6.1.0' 'mpfr>=3.1.3.p4')
makedepends=()
url='https://metacpan.org/release/Math-MPFR'
source=("http://search.cpan.org/CPAN/authors/id/S/SI/SISYPHUS/Math-MPFR-$pkgver.tar.gz")
md5sums=('8beb555617f6c1495f3285928f6fac65')
sha512sums=('4a80478f5366f36b89cf9a3807fb4152b774f9f8dde51f6d15b36773b30ca0ed0be16cdf95e9caa56d2bc328bf91f4a83de5a7992057adcc6c98a64b394efcfc')
_distdir="Math-MPFR-$pkgver"

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
