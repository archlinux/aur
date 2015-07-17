# Contributor: Weirch Sodora <sodora@gmail.com>

pkgname=perl-net-mac
_cpanname=Net-MAC
_module=Net::MAC
pkgver=2.103622
pkgrel=2
pkgdesc="$_module - Perl extension for representing and manipulating MAC addresses"
arch=('any')
url="http://search.cpan.org/~oliver/$_cpanname/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/O/OL/OLIVER/${_cpanname}-${pkgver}.tar.gz")
md5sums=('6a63fce9e6564bf3ca2ca8df02e4937e')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_cpanname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_cpanname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
