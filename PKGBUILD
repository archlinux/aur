# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=gama
pkgver=2.19
pkgrel=0
pkgdesc="GNU Gama package is dedicated to the adjustment of surveying networks."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gama/"
license=('GPL')
groups=('')
#depends=('suitesparse')
makedepends=('make' 'gcc')
optdepends=('')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
#	"https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig"
sha256sums=('382c9470a910ce9d67cfd960192478311acfed7051d64a487cf100ecf7520352')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix=$pkgdir/usr
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install
}
