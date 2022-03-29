# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Axel Reidemeister[computerkranker] <mail@axelreidemeister.de>

pkgname=libinklevel
pkgver=0.9.3
pkgrel=2
pkgdesc="A library for checking the ink level of your printer"
arch=('i686' 'x86_64')
url="http://libinklevel.sourceforge.net/"
license=('GPL')
depends=('libusb')
provides=('libinklevel.so=5-64')
source=("$pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('29d8348e3954a91f7722027181f006c22761c9b6b190d35540fc4ffb258b93ff')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
