# Maintainer: itsme <mymail@ishere.ru>

pkgname=vacuum-im
pkgver=1.2.5
pkgrel=1
pkgdesc='Crossplatform Jabber/XMPP client'
arch=('i686' 'x86_64')
url="http://www.vacuum-im.org/"
license=('GPL3')
depends=('qt4' 'openssl' 'libidn' 'libxss' 'minizip')
makedepends=('cmake')
provides=('vacuum-im' 'vacuum')
conflicts=('vacuum-im-git' 'vacuum-svn')
source=("https://github.com/Vacuum-IM/$pkgname/archive/$pkgver.tar.gz")
md5sums=('2004a882c95207b3244aadf77e822b9a')
sha256sums=('3237933f68884fb5b3422ad0fc97083b40a7aae9d8c105a23720c09599ffe5da')

build() {
	cd $pkgname-$pkgver
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd $pkgname-$pkgver/build
	make DESTDIR="$pkgdir/" install
}
