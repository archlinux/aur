# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=maskprocessor
pkgver=0.73
pkgrel=1
pkgdesc="High-Performance word generator with a per-position configureable charset"
arch=('i686' 'x86_64')
url="https://github.com/jsteube/maskprocessor"
license=('MIT')
depends=()
makedepends=()
source=("https://github.com/jsteube/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ad2b2945b896d9221eedebac9999a44043e2add3aea6aa1dae2ad1fd9eff5bc4')

build() { 
	cd "${srcdir}/${pkgname}-${pkgver}/src"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/src"

	[ ${CARCH} == "x86_64" ] && ARCHID=64 || ARCHID=32

	install -d "${pkgdir}/usr/bin"
	install -Dm755 "mp${ARCHID}.bin" "${pkgdir}/usr/bin/mp"
}
