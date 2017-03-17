# Maintainer: allencch <allencch at hotmail dot com>
pkgname=weeder2
pkgver=2.0
pkgrel=2
pkgdesc="Motif (transcription factor binding sites) discovery in sequences from coregulated genes of a single species"
arch=('i686' 'x86_64')
url="http://159.149.160.51/modtools/"
license=('custom')
depends=("sh")
source=("http://159.149.160.51/modtools/downloads/weeder${pkgver}.tar.gz")
md5sums=('3401675b24ca928b7cc54ce9ebf18b6a')

build() {
	cd "${srcdir}"
	sed -i "s|./FreqFiles|/opt/weeder2/FreqFiles|g" weeder2.cpp
	g++ weeder2.cpp -o weeder2 -O3
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/weeder2"
	cd "${srcdir}"
	install -m755 weeder2 "${pkgdir}/usr/bin"
	mv FreqFiles "${pkgdir}/opt/weeder2"
}
