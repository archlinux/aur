# Maintainer: Hendrik Donner <hendrik.donner@gmx.de>
pkgname=concurrency-kit
pkgver=0.5.2
pkgrel=1
pkgdesc="A library with concurrency related algorithms and data structures in C."
arch=('i686' 'x86_64')
url="http://concurrencykit.org"
source=("https://github.com/concurrencykit/ck/archive/$pkgver.tar.gz")
sha256sums=('5cf44b33f9279c653ec9b2b085d628c86336e4da18897be449f074283e5c5b3a')
license=('custom')

build() {
	cd ck-$pkgver
	./configure --prefix=/usr
	
	make
}

package() {
	cd ck-$pkgver

	make DESTDIR=$pkgdir install

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}	
