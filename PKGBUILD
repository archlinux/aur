# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='nfpm'
pkgver=0.10.0
pkgrel=1
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')

depends=()
makedepends=()

_basedownloadurl="${url}/releases/download/v${pkgver}/"

source=("${_basedownloadurl}/${pkgname}_${pkgver}_linux_${arch}.tar.gz")
sha256sums=('6c1bb086b6f6193bd4ed8032ac55bd185703821dd725c5a0b06ac0db9cb23d7e')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
