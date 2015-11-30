# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=crt-calibrator
pkgver=1.3
pkgrel=2
pkgdesc="CRT monitor calibrator utility for Linux VT"
url="https://github.com/maandree/crt-calibrator"
arch=(i686 x86_64)
license=(GPL3)
depends=(glibc libdrm linux)
makedepends=(make coreutils gcc glibc libdrm linux texinfo)
install=crt-calibrator.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(17bf4efafac1817d4bd8f2a1307e60365dc0a5847c45fa731ccd36490af01eee)

build() {
	cd "${srcdir}/crt-calibrator-${pkgver}"
	make DESTDIR="${pkgdir}"
}

package() {
	cd "${srcdir}/crt-calibrator-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

