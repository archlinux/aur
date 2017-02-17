# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Kaan Genç <aur@kaangenc.me>
pkgname=sqlite_modern_cpp
pkgver=3.1
pkgrel=1
pkgdesc="A lightweight modern C++ wrapper around sqlite C api."
arch=('i686' 'x86_64')
url="https://github.com/aminroosta/sqlite_modern_cpp"
license=('MIT')
depends=('sqlite')
source=("https://github.com/aminroosta/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c02d39a39cc72551a10e7a372afabce5e459d3985ef38167dc3f10d45327d8f085673b2888fd49d89ce2155ef0a45d7f24fe9c91538e5ec79bb022425f523982')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --libdir=/usr/lib
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
