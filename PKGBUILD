# Maintainer: aureolebigben <aureolebigben@gmail.com>
pkgname=cassandra-cpp-driver
_pkgname=cpp-driver
pkgver=2.16.1
pkgrel=1
pkgdesc="DataStax C/C++ Driver for Apache Cassandra"
arch=(i686 x86_64)
url="http://datastax.github.io/cpp-driver/"
license=('Apache')
depends=('libuv' 'openssl' 'zlib')
makedepends=('libuv' 'pkg-config' 'cmake')
source=("https://codeload.github.com/datastax/${_pkgname}/tar.gz/${pkgver}")

build() {
	cd "$_pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib -Wno-error .
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
sha256sums=('168d6fe9f3cf61be82cf5817024b92a186d7f944f0d390ed546f521bdabfc32e')
