# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=perl-dr-tarantool
_cpanname=DR-Tarantool
pkgver=0.44
pkgrel=1
pkgdesc='a Perl driver for Tarantool'
arch=(any)
license=('Artistic Perl')
url='http://search.cpan.org/dist/DR-Tarantool/'
depends=(perl perl-json-xs perl-anyevent perl-devel-globaldestruction perl-list-moreutils)
source=(http://search.cpan.org/CPAN/authors/id/U/UN/UNERA/$_cpanname-$pkgver.tar.gz)
sha1sums=('948684822c3e14820abb4d70a8b51ee0d234d398')

build() {
  cd $_cpanname-$pkgver
  perl Makefile.PL -- INSTALLDIRS=vendor
  make
}

check() {
  cd $_cpanname-$pkgver
  make test
}

package() {
  cd $_cpanname-$pkgver
  make install DESTDIR="$pkgdir"
}
