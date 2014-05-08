# Contributor: Weirch Sodora <sodora@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-net-mac-vendor
_cpanname=Net-MAC-Vendor
_module=Net::MAC::Vendor
pkgver=1.1901
pkgrel=1
pkgdesc="$_module - look up the vendor for a MAC"
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-libwww')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/B/BD/BDFOY/${_cpanname}-${pkgver}.tar.gz")
md5sums=('8466cb380c0163cb445044e231cd03df')

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

# vim:set ts=2 sw=2 et:
