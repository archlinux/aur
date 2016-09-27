pkgname=flabc
pkgver=1.1.2
pkgrel=1
pkgdesc="ABC notation editor"
groups=(abc)
source=(http://www.lautengesellschaft.de/cdmm/${pkgname}-${pkgver}.tar.gz)
url="http://www.lautengesellschaft.de/cdmm/"
sha256sums=('9eaec5202ac7b07b19c209d21d5c56ac3fb2d182c988bd59eaca78e524d47db3')
arch=('i686' 'x86_64')
depends=('fltk')
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
