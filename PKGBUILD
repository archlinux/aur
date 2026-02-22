# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=crt-calibrator
pkgver=1.3.5
pkgrel=1
pkgdesc="CRT monitor calibrator utility for Linux VT"
url="https://codeberg.org/maandree/crt-calibrator"
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libdrm)
makedepends=(make coreutils gcc glibc libdrm)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(9e577bd97472c3aba5df17931b6252ce8c0f04062aaf565d6d0eba4073954b60)

build() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}"
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
