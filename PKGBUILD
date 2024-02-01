# Contributor: Rudy Matela <rudy@matela.com.br>
# Maintainer: Rudy Matela <rudy@matela.com.br>
pkgname=pngcheck
pkgver=3.0.3
pkgrel=3
pkgdesc="Verifies the integrity of PNG, JNG and MNG files"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/apps/pngcheck.html"
license=('GPL-2.0-only OR X11')
depends=('libpng')
source=("http://www.libpng.org/pub/png/src/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c36a4491634af751f7798ea421321642f9590faa032eccb0dd5fb4533609dee6')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	cp Makefile.unx Makefile
}

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm755 pngcheck $pkgdir/usr/bin/pngcheck
	install -Dm755 pngsplit $pkgdir/usr/bin/pngsplit
	install -Dm755 png-fix-IDAT-windowsize $pkgdir/usr/bin/png-fix-IDAT-windowsize
}
