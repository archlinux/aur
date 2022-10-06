# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.3.6
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base' 'qt6-svg')
makedepends=('cmake')
options=('debug')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('3e040a0fdd676695de90c2332c0e0124947ccf91992a4e846dceb15fb344a338f82c48c9cb501d183b6eaa174cbc2d25c7693fc23437836833d851b2c738f3d3')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
