# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.2.6
pkgrel=2
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base' 'qt6-svg')
makedepends=('cmake')
options=('debug')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('229999e9c05029e3f206d50c66ebf6599004faa052eca6fd0c731e356bbffbbd7e46d65f5d7ff43a6bb74302788755697b668e20d1d52ba2c846a9474e6f55f5')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
