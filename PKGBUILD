# Maintainer: Gert Boers <gert.boers at gmail dot com>
pkgname=flabc
pkgver=1.3.0
pkgrel=1
pkgdesc="ABC notation editor"
groups=(abc)
source=(http://www.lautengesellschaft.de/cdmm/${pkgname}-${pkgver}.tar.gz)
url="https://www.lautengesellschaft.de/cdmm/"
sha256sums=('3ac1509ba64984874054d909e32c45f402af5cc8e20338dab6a4fec777e751cf')
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
