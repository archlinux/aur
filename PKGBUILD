# Maintainer: Hendrik Donner <hendrik.donner@gmx.de>
pkgname=concurrency-kit
pkgver=0.4.5
pkgrel=1
pkgdesc="A library with concurrency related algorithms and data structures in C."
arch=('i686' 'x86_64')
url="http://concurrencykit.org"
source=("http://concurrencykit.org/releases/ck-$pkgver.tar.gz")
sha256sums=('89feea338cd6a8efbe7bd64d033cefccb34775ea0bedbcb1612df2b822fa0356')
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
