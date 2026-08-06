# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=bmk
pkgver=0.3
pkgrel=1
pkgdesc="successor to make(1) with support for subdirectories"
arch=(x86_64 aarch64)
url="https://github.com/realchonk/bmk"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('28b98c8a2fe73b5ffe3bac6b1a570b90f88ade5b79f88d992730179ec645c7f8')
license=('ISC')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
