# Maintainer: Mark Wells (halfhorn) com dot gmail at mwellsa
pkgname=galaxia
pkgver=0.7.2
pkgrel=3
epoch=
pkgdesc="code written in C++ to generate a synthetic survey of the Milky Way"
arch=('any')
url="http://galaxia.sourceforge.net/"
license=('GPL3')
groups=()
depends=('gcc-libs')
install="$pkgname.install"
source=("https://phoenixnap.dl.sourceforge.net/project/galaxia/galaxia-0.7.2.tar.gz")
md5sums=('0f1dec3a69bde5231f7082787ef99d30')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix="/usr" --datadir="/usr/share/galaxia"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share"
	mv GalaxiaData "$pkgdir/usr/share/galaxia"
}
