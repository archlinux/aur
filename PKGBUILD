# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Michael S. Walker <barrucadu@localhost>

pkgname=ack
pkgver=3.6.0
pkgrel=2
pkgdesc="A Perl-based grep replacement, aimed at programmers with large trees of heterogeneous source code"
arch=('any')
url="http://betterthangrep.com/"
license=('GPL' 'PerlArtistic')
depends=('perl-file-next')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/$pkgname-v$pkgver.tar.gz")
md5sums=('f601a803b45974bf6f0b72207b5e883e')
sha256sums=('03144d1070649e92f6a1b7d20bdc535e2bb1ac258daabe482e9aa8277b48f005')

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
