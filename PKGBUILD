# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=protobuf-vala
pkgver=0.1.0
pkgrel=1
pkgdesc="A plugin for the Google protocol buffer compiler to generate Vala code."
arch=('i686' 'x86_64')
url="https://launchpad.net/$pkgname"
license=('GPL3')
makedepends=('protobuf')
options=('!libtool' '!emptydirs')
source=("$url/trunk/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha512sums=('effec20b6f88cc9bd323eec3adcc816289982186646a9bd106a8a3fd324b0675538beae0e8eca0176055ed9e00f7a32df8ab596e66c8f49a94807aa5ad459940')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

