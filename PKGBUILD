# Contributor: Cyker Way <cykerway at gmail dot com>
# Maintainer: Cyker Way <cykerway at gmail dot com>

pkgname=spidermonkey
pkgver=45.0.2
pkgrel=1
#epoch=
pkgdesc="Mozilla's JavaScript engine."
arch=('i686' 'x86_64')
url="http://www.mozilla.org/js/spidermonkey/"
license=('MPL')
#groups=()
#depends=()
makedepends=('gcc')
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
#noextract=()
#validpgpkeys=()
source=("$pkgname-$pkgver.tar.bz2::https://people.mozilla.org/~sfink/mozjs-45.0.2.tar.bz2")
md5sums=('2ca34f998d8b5ea79d8616dd26b5fbab')

build() {
	cd mozjs-45.0.2/js/src
    CPPFLAGS="$CPPFLAGS -O2"
	./configure --prefix=/usr
	make
}

package() {
	cd mozjs-45.0.2/js/src
	make DESTDIR="$pkgdir/" install
}

