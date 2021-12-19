# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.1.1
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base')
makedepends=('cmake')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('37dd2284866339dc14e332848f7362e9f7a7a9af6273fe7ef1061d07c255e374e8f30f7b8fd25fc9a5d3242b2d71fa93a4f8655e12b04605505c2a1f6305fe98')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_ALSA_MIDI=ON
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
