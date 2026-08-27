# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Michael S. Walker <barrucadu@localhost>

pkgname=ack
pkgver=3.10.0
pkgrel=1
pkgdesc="A Perl-based grep replacement, aimed at programmers with large trees of heterogeneous source code"
arch=('any')
url="http://beyondgrep.com/"
license=('GPL' 'PerlArtistic')
depends=('perl-file-next')
checkdepends=('perl-yaml-pp')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/$pkgname-v$pkgver.tar.gz")
md5sums=('424a6d5637d03f9fa8980000e0d6cbb3')
sha256sums=('65e83cfb38a71fca725e9a14a8201ee871e629fc6b10231e1303dd3501ba563a')

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
