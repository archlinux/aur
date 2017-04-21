# Maintainer: Arvedui <arvedui@posteo.de>
pkgname=kisslib
pkgver=0.8.3
pkgrel=2
pkgdesc="A kiss principle ebook quick launcher for Linux "
arch=('i686' 'x86_64')
url="https://github.com/jrie/kisslib"
license=('GPL3')
depends=('sqlite' 'libzip' 'gtk3')
source=("kisslib-${pkgver}.tar.gz::https://github.com/jrie/kisslib/archive/v${pkgver}.tar.gz")
md5sums=('8dc1ec25c8bb070208e27379601a2872')

build() {
	cd "$pkgname-$pkgver"
	gcc kisslib.c kiss-front.c -Wall -std=c99 -O3 -g `pkg-config --cflags gtk+-3.0` -lzip -lsqlite3 `pkg-config --libs gtk+-3.0` -o kisslib
}


package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 kisslib ${pkgdir}/usr/bin/kisslib
}
