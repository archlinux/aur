# Maintainer: nvlli <nvlli4096 at gmail dot com>

pkgname=dwmblocks-fast-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A modular status bar for window managers (fork of dwmblocks)"
arch=(x86_64)
url="https://github.com/iakobvs/dwmblocks-fast"
license=('ISC')
depends=(libx11
	alsa-lib
	cuda)
makedepends=(git
	make)
optdepends=('dwm: window manager'
	'gst-plugins-base-libs: sound notifications'
	'dunst: popup notifications'
	'pamixer: audio control and monitoring'
	'procps: send signals with pkill')
source=("git+$url")
sha256sums=('SKIP')

build() {
	cd dwmblocks-fast
	make
}

package() {
	cd dwmblocks-fast
	make DESTDIR="$pkgdir/" install
}
