# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Michael S. Walker <barrucadu@localhost>

pkgname=ack
pkgver=1.94
pkgrel=1
pkgdesc="A Perl-based grep replacement, aimed at programmers with large trees of heterogeneous source code"
arch=('any')
url="http://betterthangrep.com/"
license=('GPL' 'PerlArtistic')
depends=('perl-file-next')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/$pkgname-$pkgver.tar.gz)
md5sums=('dcf68e56bab0d394370fa102c7f08cb0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
