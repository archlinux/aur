# Maintainer: Hendrik Donner <hendrik.donner@gmx.de>
pkgname=concurrency-kit
pkgver=0.6.0
pkgrel=1
pkgdesc="A library with concurrency related algorithms and data structures in C."
arch=('i686' 'x86_64')
url="http://concurrencykit.org"
source=("https://github.com/concurrencykit/ck/archive/$pkgver.tar.gz")
sha256sums=('d7e27dd0a679e45632951e672f8288228f32310dfed2d5855e9573a9cf0d62df')
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
