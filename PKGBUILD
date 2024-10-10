# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=crt-calibrator
pkgver=1.3.4
pkgrel=1
pkgdesc="CRT monitor calibrator utility for Linux VT"
url="https://codeberg.org/maandree/crt-calibrator"
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libdrm)
makedepends=(make coreutils gcc glibc libdrm)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(1ed1393be9740ed3e217700777c6b7742c291b64e61fe17aa83154c9b8c708cc)

build() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}"
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
