# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.3.1
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base' 'qt6-svg')
makedepends=('cmake')
options=('debug')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('857fd153bc60287f95e51f76eb883be6264ba5c1aca2705f509a0e6631b611609fb3e53a825c23ca8d64cf847b39e542e722362317ca8c9a509fbba6a8c263a1')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
