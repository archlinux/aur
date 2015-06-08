# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=aspell-sl
pkgver=0.50
pkgrel=2
pkgdesc='Slovene dictionary for aspell'
url='http://aspell.net/'
arch=('any')
license=('GPL')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/sl/${pkgname}-${pkgver}-0.tar.bz2")
sha1sums=('028e41e39495ea32bc2318b9f91a9027e905479a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-0"

	./configure
	make || return 1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-0"

	make DESTDIR="$pkgdir" install
}
