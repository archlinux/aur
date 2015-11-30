# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=crt-calibrator
pkgver=1.3.1
pkgrel=1
pkgdesc="CRT monitor calibrator utility for Linux VT"
url="https://github.com/maandree/crt-calibrator"
arch=(i686 x86_64)
license=(GPL3)
depends=(glibc libdrm linux)
makedepends=(make coreutils gcc glibc libdrm linux texinfo)
install=crt-calibrator.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(23ec9913dcfb2e4a0a7879a1665a1026648367a88411e7c50621e06d0ce781e5)

build() {
	cd "${srcdir}/crt-calibrator-${pkgver}"
	make DESTDIR="${pkgdir}"
}

package() {
	cd "${srcdir}/crt-calibrator-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

