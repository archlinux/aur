# Maintainer: Jonathan Chasteen <jonathan dot chasteen at live dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=qgnomeplatform
_pkgname=QGnomePlatform
pkgver=0.6.0
pkgrel=1
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings 
as possible"
arch=('x86_64')
url="https://github.com/MartinBriza/QGnomePlatform"
license=('LGPL2.1')
depends=('qt5-base' 'gtk3' 'qt5-wayland')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MartinBriza/QGnomePlatform/archive/$pkgver.tar.gz")
sha256sums=('5e734d18adbec9ac3c0aaaccc7d995d54236f38585019d7ff67a209f8161e7d7')

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
