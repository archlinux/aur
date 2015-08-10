# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=crt-calibrator
pkgver=1.2
pkgrel=1
pkgdesc="CRT monitor calibrator utility for Linux VT"
url="https://github.com/maandree/crt-calibrator"
arch=(i686 x86_64)
license=(GPL3)
depends=(glibc libdrm linux)
makedepends=(make coreutils gcc glibc libdrm linux)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(f03c3236f57272de6046a258776d374dacb8f8e84c7b9a03e2895e505ea3e9e7)

build() {
	cd "${srcdir}/crt-calibrator-${pkgver}"
	make DESTDIR="${pkgdir}"
}

package() {
	cd "${srcdir}/crt-calibrator-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

