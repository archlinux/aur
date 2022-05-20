pkgname=abctab2ps
pkgver=1.8.21
pkgrel=1
pkgdesc="ABC notation editor"
groups=(abc)
source=(http://www.lautengesellschaft.de/cdmm/${pkgname}-${pkgver}.tar.gz)
url="http://www.lautengesellschaft.de/cdmm/"
sha256sums=('ea1576c05026b23aef2483f91e5e98d9bc93fcc0665576f7442337ca978af9de')
arch=('i686' 'x86_64')
license=('GPL')

build() {
	cd $srcdir/$pkgname-$pkgver/src
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver/src
	mkdir -p $pkgdir/usr/bin
	make PREFIX="$pkgdir/usr" docdir=$pkgdir/usr/share/doc install
}
