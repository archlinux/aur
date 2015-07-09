# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=perl-vk-app
_cpanname=VK-App
pkgver=0.12
pkgrel=1
pkgdesc='Creation of a client application for vk.com'
arch=(any)
license=(GPL2)
url='http://search.cpan.org/dist/$_cpanname/'
depends=(perl perl-lwp-protocol-https perl-json)
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MAG/$_cpanname-$pkgver.tar.gz)
sha1sums=('4878af974036204d7e6ecbf603ecb855316f7e6f')

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
