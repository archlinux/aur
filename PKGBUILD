# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Michael S. Walker <barrucadu@localhost>

pkgname=ack
pkgver=3.4.0
pkgrel=1
pkgdesc="A Perl-based grep replacement, aimed at programmers with large trees of heterogeneous source code"
arch=('any')
url="http://betterthangrep.com/"
license=('GPL' 'PerlArtistic')
depends=('perl-file-next')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/$pkgname-v$pkgver.tar.gz")
md5sums=('dde6e991b583119cfbf553e9e3975956')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make DESTDIR="$pkgdir" install
}
