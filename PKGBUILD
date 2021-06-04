# Maintainer: j.r <j.r@jugendhacker.de>
# Contributor: Jonathan Chasteen <jonathan dot chasteen at live dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=qgnomeplatform
_pkgname=QGnomePlatform
pkgver=0.8.0
pkgrel=2
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings 
as possible"
arch=('x86_64')
url="https://github.com/FedoraQt/QGnomePlatform"
license=('LGPL2.1')
depends=('gtk3' 'qt5-wayland' 'adwaita-qt>=1.3.1')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FedoraQt/QGnomePlatform/archive/$pkgver.tar.gz")
sha256sums=('b95d38558dd1f1af9099985d432973cad0d6dcb00d069451862ea89b2b1443f5')

build() {
	cd "$srcdir"
  cmake -B build -S "$_pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="/usr" -Wno-dev
	make -C build
}

package() {
	cd "$srcdir"
	make -C build DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
