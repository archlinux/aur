# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.2.2
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base')
makedepends=('cmake')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('98117adac65690cc0746f3fe05eff9393d63f38809a0892be347b94452e98d97163e8b09ec158de618c82db36ed6debd40e84eae395429e97c125b3abddfaf93')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
