# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.0.7
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base')
makedepends=('cmake')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('163fb010d53ac42bcafc3a66df386fee3ee7a58b12a0f4f2532d207bd7a790eb2dc4932b7c8d1bf8cec046b0e4fb01e09163ac65b63589b525d557b252345a4c')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_ALSA_MIDI=ON
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
