# Maintainer: sh0 <mee@sh0.org>
pkgname=perl-math-calc-units
pkgver=1.07
pkgrel=1
pkgdesc="Human-readable unit-aware calculator"
arch=('any')
url="http://search.cpan.org/dist/Math-Calc-Units"
license=('unknown')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/S/SF/SFINK/Math-Calc-Units-$pkgver.tar.gz)
md5sums=('56e4be0e64d6c8fc27c8f87d0d3cebd8')

build() {
  cd "$srcdir/Math-Calc-Units-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Math-Calc-Units-$pkgver"
  make install DESTDIR="$pkgdir/"
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
