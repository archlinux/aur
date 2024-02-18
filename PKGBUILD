# Maintainer: allencch <allencch at hotmail dot com>
pkgname=weeder2
pkgver=2.0.1
pkgrel=1
pkgdesc="Motif (transcription factor binding sites) discovery in sequences from coregulated genes of a single species"
arch=('i686' 'x86_64')
url="http://159.149.160.51/modtools/"
license=('custom')
depends=("sh")
source=("http://159.149.160.51/modtools/downloads/weeder2.0.1.tar.gz")
md5sums=('192a97db13e11afd542d747cb11a1a9e')

build() {
	cd "${srcdir}/Weeder2.0"
	sed -i "s|./FreqFiles|/opt/weeder2/FreqFiles|g" weeder2.cpp
	g++ weeder2.cpp -o weeder2 -O3
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/weeder2"
	cd "${srcdir}/Weeder2.0"
	install -m755 weeder2 "${pkgdir}/usr/bin"
	mv FreqFiles "${pkgdir}/opt/weeder2"
}
