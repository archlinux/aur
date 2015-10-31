# Maintainer: Mangix <rosenp@gmail.com>

pkgname=statsprocessor
pkgver=0.11
pkgrel=1
pkgdesc="Word-generator based on per-position markov-chains"
arch=('i686' 'x86_64')
url="https://github.com/jsteube/statsprocessor"
license=('MIT')
depends=()
makedepends=()
source=("https://github.com/jsteube/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bf9504b6ac5b83a8272ef327764e2fc001bbeb77802b9c4ab0c8b1a964f1e563')

build() { 
	cd "${srcdir}/${pkgname}-${pkgver}/src"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/src"

	[ ${CARCH} == "x86_64" ] && ARCHID=64 || ARCHID=32

	install -d "${pkgdir}/usr/bin"
	install -Dm755 "sp${ARCHID}.bin" "${pkgdir}/usr/bin/sp"
}
