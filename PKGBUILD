# Contributor: Asuka Minato
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Axel Reidemeister[computerkranker] <mail@axelreidemeister.de>

pkgname=libinklevel
pkgver=0.9.5
pkgrel=1
pkgdesc="A library for checking the ink level of your printer"
arch=('i686' 'x86_64')
url="http://libinklevel.sourceforge.net/"
license=('GPL')
depends=('libusb' 'libxml2' 'glibc')
provides=('libinklevel.so=5-64')
source=("$pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3e889cf7e3400524f514084775d653eeae0b1b7320f28741a343cbc95d7c980a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
