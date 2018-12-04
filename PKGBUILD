# Maintainer:  Saša Janiška <gour@atmarama.com>
pkgname=aspell-hr
pkgver=0.51
pkgrel=1
pkgdesc="Croatian dictionary for aspell"
url='http://aspell.net/'
arch=('any')
license=('GPL')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/hr/${pkgname}-${pkgver}-0.tar.bz2")
sha1sums=('6788b9001287f9debd59803f5f9c5005b701f8f7')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-0"

	./configure
	make || return 1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-0"

	make DESTDIR="$pkgdir" install
}
