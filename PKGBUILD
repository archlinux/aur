# Maintainer: Richard Vock <vock at cs dot uni-bonn dot de>

pkgname=libunittest
pkgver=8.1.0
pkgrel=1
pkgdesc="A portable C++ library for unit testing"
arch=('x86_64' 'i686')
url='http://libunittest.sourceforge.net/'
license=('MIT')
depends=()
makedepends=()
source=("http://downloads.sourceforge.net/project/libunittest/libunittest-${pkgver}.tar.gz")
md5sums=('38a19c6660088ff1c8e6b72360c95ef6')

build() {
	cd $srcdir/libunittest-$pkgver
    ./configure --prefix="$pkgdir/usr"
	make
}

package() {
	cd $srcdir/libunittest-$pkgver

#make install INSTALLDIR="$pkgdir/usr"
	make install INSTALLDIR="$pkgdir/usr"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
