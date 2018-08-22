# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=dqlite
pkgver=0.2.1
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('Apache')
depends=('libuv>=1.8.0' 'sqlite-replication>=3.22.0')
source=("https://github.com/CanonicalLtd/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4e1b65c70556e435dc7fa289d4d8bbc967db527b9ae7cd51d05e5a1a285a78ec')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
