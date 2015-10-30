# Maintainer: Hendrik Donner <hendrik.donner@gmx.de>
pkgname=concurrency-kit
pkgver=0.5.0
pkgrel=1
pkgdesc="A library with concurrency related algorithms and data structures in C."
arch=('i686' 'x86_64')
url="http://concurrencykit.org"
source=("https://github.com/concurrencykit/ck/archive/$pkgver.tar.gz")
sha256sums=('c1c77c101a268d2f5b3481a8b5729fab8016f2f7a42313bf01e0c98149106027')
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
