# Maintainer: George Hu <integral@archlinux.org>

pkgname=tbox
pkgver=1.8.1
pkgrel=1
pkgdesc="A glib-like multi-platform C library"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/tboox/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
provides=('libtbox.so')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('48284c1f1f6e4e74ce1b4d2447c3141fdfdd3a20ef1cb30fc2f1021149227fdb')

build() {
	cd "${pkgname}-${pkgver}/"
	./configure --prefix=/usr --kind=shared --demo=false
	make
}

package() {
	DESTDIR="${pkgdir}" make -C "${pkgname}-${pkgver}" install
}
