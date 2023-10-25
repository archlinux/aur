pkgname=abctab2ps
pkgver=1.8.25
pkgrel=1
pkgdesc="ABC notation editor"
groups=(abc)
source=(http://www.lautengesellschaft.de/cdmm/${pkgname}-${pkgver}.tar.gz)
url="http://www.lautengesellschaft.de/cdmm/"
sha256sums=('3548bbc977094e920c80be143b68dea271d8f9f06b80b1000ce670273c371be5')
arch=('i686' 'x86_64')
license=('GPL')

build() {
	cd $srcdir/$pkgname-$pkgver/src
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver/src
	mkdir -p $pkgdir/usr/bin
	make PREFIX="$pkgdir/usr" MANDIR="$pkgdir"/usr/share/man/man1 install

}
