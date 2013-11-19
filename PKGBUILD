# Maintainer: Mark Grimes <mgrimes at peculier dot com>
pkgname=perl-math-calc-units
pkgver=1.07
pkgrel=2
pkgdesc="Human-readable unit-aware calculator"
_dist=Math-Calc-Units
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('unknown')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/S/SF/SFINK/$_dist-$pkgver.tar.gz)
md5sums=('56e4be0e64d6c8fc27c8f87d0d3cebd8')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

# vim:set ts=2 sw=2 et:
