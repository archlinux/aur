# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.2.3
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base')
makedepends=('cmake')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('1c167f569fb3345edb0402bccc220b296a3c54f78ab141cb2280caa6576726ffe7e4ee49c702abb1e6368ae8c173684645f7fbfbd39511868e14631af60b5dfd')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
