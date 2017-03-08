# Maintainer: mortzprk <mortz.prk@gmail.com>

pkgname=pidgin-embeddedvideo
pkgver=1.2
pkgrel=3
pkgdesc="Watch videos directly into your Pidgin conversation"
arch=('i686' 'x86_64')
url="https://github.com/stefanistrate/pidgin-embeddedvideo/"
license=('GPL')
provides=('pidgin-embeddedvideo')
depends=('pidgin')
makedepends=('pidgin' 'glib2' 'libxml2' 'libwebkit' 'curl' 'flashplugin')
source=(https://raw.githubusercontent.com/stefanistrate/pidgin-embeddedvideo/master/downloads/$pkgname-$pkgver.tar.gz)

sha256sums=('929dadd24e05c677d3e182ca10d0bcf2cf9fe7cff87c18d55cd55eb7bfebc04c')

build() {
	cd $srcdir/$pkgname
	./configure
	make
}
package(){
	cd $srcdir/$pkgname
	make DESTDIR=$pkgdir install || return 1
}

