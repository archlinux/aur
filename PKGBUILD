# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=qgnomeplatform
_pkgname=QGnomePlatform
pkgver=0.5
pkgrel=1
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings 
as possible"
arch=('x86_64')
url="https://github.com/MartinBriza/QGnomePlatform"
license=('LGPL2.1')
depends=('qt5-base' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MartinBriza/QGnomePlatform/archive/$pkgver.tar.gz")
sha256sums=('b835b700625ff5fe4eb6c6cc1ddcd333b6e6a32d3cc5e52b82046226b2d9b6ca')

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
# vim:set ts=2 sw=2 et:
