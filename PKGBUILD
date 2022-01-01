# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.1.2
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base')
makedepends=('cmake')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('34443e5b44531fdbdb22b5f089f0612c0ea6864650e28b462a14a5f35dddf237a184e9417fb52cb16996c039285d4275e7bffc1f5e344cf754db6834c5e0a577')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_ALSA_MIDI=ON
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
