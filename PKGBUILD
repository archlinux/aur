# Maintainer: Noah Gil <xlash19o13@gmail.com>
pkgname=streamspeed
pkgver=1.0.0
pkgrel=1
epoch=0
pkgdesc="A simple C program that prints the throughput speed of stdin"
arch=('x86_64')
url="https://github.com/xlash123/streamspeed"
license=('GPL')
source=("https://github.com/xlash123/streamspeed/archive/refs/tags/${pkgver}.zip")
sha256sums=('e79cbf6d3bbda524b7768e200ee6fba4a874171e2877998f72891ba3a305ed68')

build() {
	cd "${pkgname}-${pkgver}"
	gcc src/streamspeed.c -o streamspeed -pthread
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm775 streamspeed "$pkgdir/usr/bin/streamspeed"
}
