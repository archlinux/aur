# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='nfpm-bin'
_pkgname="${pkgname%-bin}"
pkgver=v2.11.3
pkgrel=1
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=()
makedepends=()

_basedownloadurl="${url}/releases/download/v${pkgver#v}"

source=("${_basedownloadurl}/${_pkgname}_${pkgver#v}_linux_${arch}.tar.gz")
sha256sums=('da82e726e83b39481e79b160262cf700750ca8b15a62f7bcb65d587f65f508fc')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
