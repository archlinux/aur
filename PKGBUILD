# Maintainer: Beej <beej@beej.us>
# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=nfrotz
pkgver=0.3.3
pkgrel=3
pkgdesc="Z-machine interpreter for playing Interactive Fiction games, with support for unicode"
arch=(i686 x86_64)
url="http://www.ifarchive.org/indexes/if-archiveXinfocomXinterpreters.html"
license=('GPL')
depends=('glibc')
makedepends=('unzip')
source=(http://www.ifarchive.org/if-archive/infocom/interpreters/frotz/$pkgname-$pkgver.tgz)
md5sums=('78e0cafcb30b1539629ea5f5b8a61dbf')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make \
		PREFIX="$pkgdir"/usr \
		MAN_PREFIX="$pkgdir"/usr \
		DESTDIR="$pkgdir" \
		install
}

