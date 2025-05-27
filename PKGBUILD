# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Michael S. Walker <barrucadu@localhost>

pkgname=ack
pkgver=3.9.0
pkgrel=1
pkgdesc="A Perl-based grep replacement, aimed at programmers with large trees of heterogeneous source code"
arch=('any')
url="http://betterthangrep.com/"
license=('GPL' 'PerlArtistic')
depends=('perl-file-next')
checkdepends=('perl-yaml-pp')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/$pkgname-v$pkgver.tar.gz")
md5sums=('03c79c88b67f7ff7a6a00ea3ec84fc7e')
sha256sums=('94ed477e3b3f94d126cec7329f0e8399f1d0ce82c7c4d882a94adb150e7ffc90')

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
