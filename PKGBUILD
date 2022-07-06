# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.3.3
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base' 'qt6-svg')
makedepends=('cmake')
options=('debug')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('ce3b9f20d8f27cd51c47e7c5a78721bb7c0a83602bcec8797a45b87f380dbb9c4001357ab1d7136527cb0c6ce1c337931eb3fb24ee382f772d03b383173f6c93')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
