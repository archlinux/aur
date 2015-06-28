# Maintainer: Max Medar <medarlol at gmail dot com>

pkgname=simple-fb2-reader
pkgver=1.0.9
pkgrel=1
pkgdesc="Simple FB2 book reader on GTK+3"
arch=('i686' 'x86_64')
url="http://github.com/Cactus64k/simple-fb2-reader"
license=('GPL3')
depends=('libxml2>=2.8.0' 'gtk3>=3.4.2' 'glib2>=2.33.12' 'libzip>=0.10.1')
makedepends=('gettext>=0.18.1.1' 'pkg-config>=0.26')
install=$pkgname.install
source=(http://github.com/Cactus64k/simple-fb2-reader/archive/$pkgver.tar.gz)
md5sums=('69592303fb3baf306350d89a40ecc7cd')

build() {
	cd $srcdir/simple-fb2-reader-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd $srcdir/simple-fb2-reader-$pkgver
	make DESTDIR=$pkgdir install
}

