# Maintainer: Gert Boers <gert.boers at gmail dot com>
pkgname=flabc
pkgver=1.2.1
pkgrel=2
pkgdesc="ABC notation editor"
groups=(abc)
source=(http://www.lautengesellschaft.de/cdmm/${pkgname}-${pkgver}.tar.gz)
url="http://www.lautengesellschaft.de/cdmm/"
sha256sums=('5e7f292921f08d22a36683c916690a99f1e177a87fd7c9d5c05bfcce323a76b8')
arch=('i686' 'x86_64')
depends=('fltk')
optdepends=('abcm2ps')
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
