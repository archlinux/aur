# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=crt-calibrator
pkgver=1.1
pkgrel=1
pkgdesc="CRT monitor calibrator utility for Linux VT"
url="https://github.com/maandree/crt-calibrator"
arch=(i686 x86_64)
license=(GPL3)
depends=(glibc libdrm linux)
makedepends=(make coreutils gcc glibc libdrm linux)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(b271db0fb12997e5704c8d92cc7247780ac6580c19eb5829a9ce4acebe522e7e)

build() {
	cd "${srcdir}/crt-calibrator-${pkgver}"
	make DESTDIR="${pkgdir}"
}

package() {
	cd "${srcdir}/crt-calibrator-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

