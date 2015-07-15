pkgname=pidgin-embeddedvideo
pkgver=1.2
pkgrel=2
pkgdesc="Watch videos directly into your Pidgin conversation"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pidgin-embeddedvideo/"
license=('GPL')
provides=('pidgin-embeddedvideo')
depends=('pidgin')
makedepends=('pidgin' 'glib2' 'libxml2' 'libwebkit' 'curl' 'flashplugin')
source=(http://pidgin-embeddedvideo.googlecode.com/files/$pkgname-$pkgver.tar.gz)

md5sums=('c23ba4e7388fca3246eb79030a9f107e')

build() {
	cd $srcdir/$pkgname
	./configure
	make
}
package(){
	cd $srcdir/$pkgname
	make DESTDIR=$pkgdir install || return 1
}

