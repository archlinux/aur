# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.3.5
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base' 'qt6-svg')
makedepends=('cmake')
options=('debug')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('61e813cc82009dfbedb707207ac02d8a388f20b83fa96eb1051edc7660180da05cd6fec2c69424539f371e3edb281ec7ea3eaf4038eb699e4ba00dbcb85820b5')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
