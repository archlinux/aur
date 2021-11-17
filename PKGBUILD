# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.0.5
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt6-base')
makedepends=('cmake')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('45f5ff64261d9b2ec53707f2991fd04ac9c1bef3f7661f909a39f06ed1b5bc3b787806a3a702ba5adffe46821833377f15808d9cca18f303284933c265079249')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_ALSA_MIDI=ON
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
