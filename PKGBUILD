# Maintainer: Jan Tulak <jan@tulak.me>
pkgname=librdrand
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="A library and an userspace application (rdrand-gen) for easy access to Intel's RdRand DRNG."
arch=("x86_64")
url="https://github.com/BroukPytlik/RdRand"
license=('LGPL')
depends=('openssl')
source=("https://github.com/BroukPytlik/RdRand/archive/$pkgver.tar.gz")
md5sums=("e5aa7feb2f1f21b56911c58e8faba475")

build() {
	cd "RdRand-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "RdRand-$pkgver"
	make DESTDIR="$pkgdir/" install
}
