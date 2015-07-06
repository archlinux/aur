# Maintainer: masutu <masutu dot arch at googlemail dot com>
# Contributor: masutu <masutu dot arch at googlemail dot com>
pkgname=perl-net-liblo
pkgver=0.06
pkgrel=1
pkgdesc="Perl interface for liblo Lightweight OSC library"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~njh/Net-LibLO-0.06/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'liblo')
options=(!emptydirs)
source=('http://search.cpan.org/CPAN/authors/id/N/NJ/NJH/Net-LibLO-0.06.tar.gz')
md5sums=('851b50ff14b0afeb8c5c9f38289526ed')

build() {
  cd "$srcdir/Net-LibLO-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Net-LibLO-$pkgver"
  make install DESTDIR="$pkgdir/"
  install -Dm 644 examples/liblo_send.pl $pkgdir/usr/share/$pkgname/examples/liblo_send.pl
  install -Dm 644 examples/pingclient.pl $pkgdir/usr/share/$pkgname/examples/pingclient.pl
  install -Dm 644 examples/pingserver.pl $pkgdir/usr/share/$pkgname/examples/pingserver.pl
}

# vim:set ts=2 sw=2 et:
