# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='nfpm'
pkgver=0.13.0
pkgrel=1
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')

depends=()
makedepends=()

_basedownloadurl="${url}/releases/download/v${pkgver}/"

source=("${_basedownloadurl}/${pkgname}_${pkgver}_linux_${arch}.tar.gz")
sha256sums=('fbb51c0c48137ad25645ce4437f1d01223f1375e2f9366374aa3b7624306b741')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
