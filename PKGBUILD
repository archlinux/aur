# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.2.4
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base')
makedepends=('cmake')
options=('debug')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('55e9a2ddb15a607a2fe4ac67eb634f99bf80d06dd2835bb7b5f95205f5bf826d47511377c69c3b5f0f852d4343263dba364b58406452c0725fe96f8bcc5a2cd1')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
