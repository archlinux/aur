# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=soveran
pkgname=map
pkgver=0.1.1
pkgrel=1
pkgdesc="Map lines from stdin to commands"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('BSD')

provides=("${pkgname}")
makedepends=('gzip' 'make' 'gcc')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6903d2bb6d7e0cddceee487cc35b442e5e78a459785aa5ae7c84f13090f193f0')


build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	make ${pkgname}
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	make install PREFIX="${pkgdir}/usr/"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
