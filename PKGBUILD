# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>
# Maintainer: Martin Minka <martin.minka@gmail.com>

pkgname="mozjpeg-opt"
pkgver=3.0
pkgrel=1
pkgdesc="JPEG image codec with accelerated baseline decoding and superior encoding - installed under /opt"
url="https://github.com/mozilla/mozjpeg"
license=("BSD")
arch=("i686" "x86_64")
makedepends=("nasm")
source=("https://github.com/mozilla/mozjpeg/archive/v${pkgver}.tar.gz")
sha1sums=('4c24eaa28e875cfb61d542a837df869b19a586a8')

build() {
	cd "${srcdir}/mozjpeg-${pkgver}"
	autoreconf -fiv
	./configure --prefix=/opt/mozjpeg --with-jpeg8
	make
}

package() {
	cd "${srcdir}/mozjpeg-${pkgver}"
	make \
		DESTDIR="${pkgdir}" \
		install
}
