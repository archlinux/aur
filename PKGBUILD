# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=cassandra-cpp-driver
_pkgname=cpp-driver
pkgver=2.2.2
pkgrel=1
pkgdesc="DataStax C/C++ Driver for Apache Cassandra"
arch=(i686 x86_64)
url="http://datastax.github.io/cpp-driver/"
license=('Apache')
depends=('libuv' 'openssl')
makedepends=('libuv')
source=("https://codeload.github.com/datastax/${_pkgname}/tar.gz/${pkgver}")

build() {
	cd "$_pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib .
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
sha256sums=('cb3887f53fb5a4b4fa7336671363ac37c571c3fe3be0982084b1aa6d28f06f4c')
