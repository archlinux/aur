# Maintainer: Jonas Weber <contact@jonasw.de>
pkgname=gpp
pkgver=2.24
pkgrel=1
pkgdesc="A general-purpose preprocessor with customizable syntax, suitable for a wide range of preprocessing tasks"
arch=('any')
url="http://en.nothingisreal.com/wiki/GPP"
license=('GPL')
makedepends=('devel-tools')
provides=('gpp')
source=(
"http://files.nothingisreal.com/software/$pkgname/$pkgname-${pkgver}.tar.bz2"
"http://files.nothingisreal.com/software/$pkgname/$pkgname-${pkgver}.tar.bz2.sig"
)
md5sums=('f04c2a23312ab3d0c462c7972d1c6aa6'
         'SKIP')
validpgpkeys=("28F47A15AB82C216D278DEB92B119C3AEFBF4915")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
