# Contributor: Cyker Way <cykerway at gmail dot com>
# Maintainer: Cyker Way <cykerway at gmail dot com>

pkgname=spidermonkey
pkgver=38
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
source=("$pkgname-$pkgver.tar.bz2::https://people.mozilla.org/~sstangl/mozjs-38.2.1.rc0.tar.bz2")
sha256sums=('01994c758174bc173bcf4960f05ecb4da21014f09641a63b2952bbf9eeaa8b5c')

build() {
	cd mozjs-38.0.0/js/src
    CPPFLAGS="$CPPFLAGS -O2"
	./configure --prefix=/usr
	make
}

package() {
	cd mozjs-38.0.0/js/src
	make DESTDIR="$pkgdir/" install
}

