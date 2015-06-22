# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=cassandra-cpp-driver
_pkgname=cpp-driver
pkgver=2.0.1
pkgrel=1
pkgdesc="DataStax C/C++ Driver for Apache Cassandra"
arch=(i686 x86_64)
url="http://datastax.github.io/cpp-driver/"
license=('Apache')
depends=('libuv' 'openssl')
conflicts=('cassandra-cpp-git')
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
md5sums=('70bf83e1cbd0d35b7e5ed66fc4dccbb1')
