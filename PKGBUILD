# Maintainer: Jonathan Chasteen <jonathan dot chasteen at live dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=qgnomeplatform
_pkgname=QGnomePlatform
pkgver=0.6.1
pkgrel=1
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings 
as possible"
arch=('x86_64')
url="https://github.com/MartinBriza/QGnomePlatform"
license=('LGPL2.1')
depends=('qt5-base' 'gtk3' 'qt5-wayland' 'qt5-x11extras')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MartinBriza/QGnomePlatform/archive/$pkgver.tar.gz")
sha256sums=('b2630b56bd1d2798f5403a74ec53df694a91f239742f0086f3d565e28bc3382a')

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
