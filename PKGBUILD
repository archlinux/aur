pkgname=abctab2ps
pkgver=1.8.24
pkgrel=2
pkgdesc="ABC notation editor"
groups=(abc)
source=(http://www.lautengesellschaft.de/cdmm/${pkgname}-${pkgver}.tar.gz)
url="http://www.lautengesellschaft.de/cdmm/"
sha256sums=('ac0ed606213402ef6270b8553d7ce16670cb5ab19f4923b4638910dd28bbaba5')
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
