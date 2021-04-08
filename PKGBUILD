# Maintainer: j.r <j.r@jugendhacker.de>
# Contributor: Jonathan Chasteen <jonathan dot chasteen at live dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=qgnomeplatform
_pkgname=QGnomePlatform
pkgver=0.7.1
pkgrel=1
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings 
as possible"
arch=('x86_64')
url="https://github.com/FedoraQt/QGnomePlatform"
license=('LGPL2.1')
depends=('gtk3' 'qt5-wayland' 'adwaita-qt>=1.2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FedoraQt/QGnomePlatform/archive/$pkgver.tar.gz")
sha256sums=('f479ea5ca28108bc6b66e6790c35831d0e359b709db93f49d1b7015d25335eb9')

prepare() {
  cd $_pkgname-$pkgver
}

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
