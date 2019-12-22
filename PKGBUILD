# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='nfpm'
pkgver=v1.1.9
pkgrel=1
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')

depends=()
makedepends=()

_basedownloadurl="${url}/releases/download/v${pkgver#v}"

source=("${_basedownloadurl}/${pkgname}_${pkgver#v}_linux_${arch}.tar.gz")
sha256sums=('4765671a7d9e6ec23c72b938a89571118ef8f522602074f4c619cbf8a0296631')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
