# Maintainer: aimileus <me at aimileus dot nl>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=qgnomeplatform
_pkgname=QGnomePlatform
pkgver=0.4
pkgrel=1
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings 
as possible"
arch=('x86_64')
url="https://github.com/MartinBriza/QGnomePlatform"
license=('LGPL2.1')
depends=('qt5-base' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MartinBriza/QGnomePlatform/archive/$pkgver.tar.gz")
sha256sums=('1001415150d0c7a84743f078002e396583f8d04346a8d5870f2ac5024a671175')

build() {
	cd $_pkgname-$pkgver
	qmake-qt5
	make
}

check() {
	cd $_pkgname-$pkgver
	make -k check
}

package() {
	cd $_pkgname-$pkgver
	make INSTALL_ROOT="$pkgdir/" install
}

