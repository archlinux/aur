# Submitter: Gavin Lloyd <gavinhungry@gmail.com>
# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=gqrx-scanner
pkgver=1.0.2
pkgrel=2
pkgdesc="A frequency scanner for Gqrx Software Defined Radio receiver"
arch=('x86_64')
url="https://github.com/neural75/gqrx-scanner"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d15739fb99292ec10ce707b7d802b2cbed1a856c8e8bffd6ce827c091886231b')

build() {
	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
