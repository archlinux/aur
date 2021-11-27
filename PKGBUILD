# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.0.9
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base')
makedepends=('cmake')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('b6e60d8b784c52863a0d845ac39e6133d4abaaf321b8c61ad0c017e740181267f3859579ea2b3582596a81aae13ee106bf3e8edd60b71d3452d614c4db4dfb51')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_ALSA_MIDI=ON
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
