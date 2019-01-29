# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpfr'
pkgver='4.07'
pkgrel='1'
pkgdesc="Math::MPFR - perl interface to the MPFR (floating point) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'gmp>=6.1.1' 'mpfr>=3.1.4.p1')
makedepends=('perl' 'gmp>=6.1.1' 'mpfr>=3.1.4.p1')
url='https://metacpan.org/release/Math-MPFR'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-MPFR-$pkgver.tar.gz")
md5sums=('d23ce355038018d29c67b827293a9c46')
sha512sums=('520303e6e42f3e844f1b0118679739b04c4a39500663876c02507e1dbd7cc4dea4903d9a6c0f49bc8cf2149702b0eaf2852d9398e0844c8c214943979205b821')
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
