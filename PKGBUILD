# Maintainer: Hendrik Donner <hendrik.donner@gmx.de>
pkgname=concurrency-kit
pkgver=0.5.1
pkgrel=1
pkgdesc="A library with concurrency related algorithms and data structures in C."
arch=('i686' 'x86_64')
url="http://concurrencykit.org"
source=("https://github.com/concurrencykit/ck/archive/$pkgver.tar.gz")
sha256sums=('efeebda38d68a7c194a4632e842987f03be58f2f910f0745a56f0ae7d9a1dac5')
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
