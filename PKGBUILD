# Maintainer: Jozef Riha <jose1711@gmail.com>

pkgname=panomatic
pkgver=0.9.4
pkgrel=5
pkgdesc="Automatic control point creator for Hugin"
arch=('i686' 'x86_64')
url="http://aorlinsk2.free.fr/panomatic/"
license=('GPL-2')
depends=('boost>=1.34.1')
source=("http://aorlinsk2.free.fr/panomatic/bin/${pkgname}-${pkgver}-src.tar.bz2" "http://aorlinsk2.free.fr/panomatic/panomatic_gcc44.patch")
md5sums=('0b08a4f7e1b4ecaf6ae364779a01da07' 'bf3ce7a9c9b9844a3658694df218cc3e')

build() {
	cd $srcdir/${pkgname}-${pkgver}
	patch -Np1 -i ../${pkgname}_gcc44.patch
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
