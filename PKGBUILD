# Maintainer: Jan Tulak <jan@tulak.me>
pkgname=librdrand
pkgver=2.1.1
pkgrel=2
epoch=
pkgdesc="A library and an userspace application (rdrand-gen) for easy access to Intel's RdRand DRNG."
arch=("x86_64")
url="https://github.com/BroukPytlik/RdRand"
license=('LGPL')
depends=('openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BroukPytlik/RdRand/archive/$pkgver.tar.gz")
md5sums=('a214829d578f6e3b41e5446b41e4252f')

build() {
	cd "RdRand-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "RdRand-$pkgver"
	make DESTDIR="$pkgdir/" install
}
