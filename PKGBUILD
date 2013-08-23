# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-math-interpolate
pkgver=1.05
pkgrel=1
pkgdesc="Routines for interpolating data sets"
arch=("any")
url="http://search.cpan.org/dist/Math-Interpolate/"
license=("unknown")
source=(http://search.cpan.org/CPAN/authors/id/B/BZ/BZAJAC/Math-Interpolate-$pkgver.tar.gz)
depends=("perl")
options=(!emptydirs)
md5sums=('1826c6c24b75a2a27964c3dac198adac')

build() {
  cd "$srcdir/Math-Interpolate-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Math-Interpolate-$pkgver"
  make test
}

package() {
  cd "$srcdir/Math-Interpolate-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
