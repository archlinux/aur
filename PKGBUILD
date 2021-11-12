# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Dynamic, bytecode-compiled programming language and a dialect of Python'
pkgname=kuroko
pkgver=1.1.2
pkgrel=1
url=https://kuroko-lang.github.io
license=(custom:MIT)
arch=(x86_64)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuroko-lang/kuroko/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0c1371afd74c1bdedb275d7ca3698243d040b8945bba9f2bddd96212bda54fe6039862eeb73c0c79dd6d02a21dfb874ec4dd944287de5bf00ae0b7a244647809')

build () {
	make -C "${pkgname}-${pkgver}" prefix=/usr
}

package () {
	make -C "${pkgname}-${pkgver}" prefix=/usr DESTDIR="${pkgdir}" install
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
