# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=bmk
pkgver=0.4
pkgrel=1
pkgdesc="successor to make(1) with support for subdirectories"
arch=(x86_64 aarch64)
url="https://github.com/realchonk/bmk"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a30eee0cc8beaf88e5cc9728f26e15923cc16bd43e948f7e7e29518219702783')
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
