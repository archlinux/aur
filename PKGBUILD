# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='nfpm'
pkgver=v1.3.2
pkgrel=1
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')

depends=()
makedepends=()

_basedownloadurl="${url}/releases/download/v${pkgver#v}"

source=("${_basedownloadurl}/${pkgname}_${pkgver#v}_linux_${arch}.tar.gz")
sha256sums=('47aa4970578aaf1df7b492e0df78068ed9fb27a562e4e0e9ac2cbc3f816af7d2')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
