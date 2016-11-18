# Maintainer: Max Medar <medarlol at gmail dot com>

pkgname=simple-fb2-reader
pkgver=1.1.1
pkgrel=2
pkgdesc="Simple FB2 book reader on GTK+3"
arch=('i686' 'x86_64')
url="http://github.com/Cactus64k/simple-fb2-reader"
license=('GPL3')
depends=('libxml2>=2.9.1' 'gtk3>=3.14.5' 'glib2>=2.33.12' 'libzip>=0.10.1' 'sqlite>=3.8.7.1')
makedepends=('gettext>=0.19.3' 'pkg-config>=0.28')
install=$pkgname.install
source=(http://github.com/Cactus64k/simple-fb2-reader/archive/$pkgver.tar.gz)
md5sums=('85cdaed7419fed02c314e19cb665d96f')

build() {
	cd $srcdir/simple-fb2-reader-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd $srcdir/simple-fb2-reader-$pkgver
	make DESTDIR=$pkgdir install
}

