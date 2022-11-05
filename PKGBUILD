# Maintainer: Gert Boers <gert.boers at gmail dot com>
pkgname=flabc
pkgver=1.2.2
pkgrel=1
pkgdesc="ABC notation editor"
groups=(abc)
source=(http://www.lautengesellschaft.de/cdmm/${pkgname}-${pkgver}.tar.gz)
url="https://www.lautengesellschaft.de/cdmm/"
sha256sums=('1240430a393592081e55ccd6125dad5986ac0f3fc4672b7adcd0215f0161f5ce')
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
