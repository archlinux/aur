# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='nfpm'
pkgver=v1.4.0
pkgrel=1
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')

depends=()
makedepends=()

_basedownloadurl="${url}/releases/download/v${pkgver#v}"

source=("${_basedownloadurl}/${pkgname}_${pkgver#v}_linux_${arch}.tar.gz")
sha256sums=('9db994c92c6d03173e0a5749c36d5d4b5636559bf3bc9bf387188b4824612bbf')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
