# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=bmk
pkgver=0.1
pkgrel=1
pkgdesc="successor to make(1) with support for subdirectories"
arch=(x86_64 aarch64)
url="https://github.com/realchonk/bmk"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('91286d0caf8a8e304603e126783b3cf59ace130f74380423ffca082bdd5f7578')
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
