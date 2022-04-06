# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.2.5
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base')
makedepends=('cmake')
options=('debug')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('d039f0aec37b078170b4b0d48d905857c440fc977d24a566e9aad53955ba1301b792fcff1188e673b7fef17cfb74442b79283ce4af3f419e3bf1b9f9c4046bc9')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
