# Maintainer: Hendrik Donner <hendrik.donner@gmx.de>
pkgname=concurrency-kit
pkgver=0.7.0
pkgrel=1
pkgdesc="A library with concurrency related algorithms and data structures in C."
arch=('i686' 'x86_64')
url="http://concurrencykit.org"
source=("https://github.com/concurrencykit/ck/archive/$pkgver.tar.gz")
sha256sums=('e730cb448fb0ecf9d19bf4c7efe9efc3c04dd9127311d87d8f91484742b0da24')
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
