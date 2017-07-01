# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=telegnome
pkgver=0.3.3
pkgrel=1
pkgdesc="GNOME Teletext viewer"
arch=('x86_64' 'i686')
url="http://telegnome.sourceforge.net/"
license=('GPL')
depends=('gtk3')
makedepends=('itstool')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('8446e10508802520d47f34fe10a4ddb032f556e522d8dba474226559637a58bf')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
