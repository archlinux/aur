# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='seihon'
pkgver=v0.5.0
pkgrel=1
pkgdesc='A simple tool to publish multi-arch images on the Docker Hub.'
url='https://github.com/ldez/seihon'
arch=('x86_64' 'i686' 'aarch64')
license=('APACHE')

depends=()
makedepends=()
optdepends=()

_basedownloadurl="https://github.com/ldez/${pkgname}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('c9bad374f705cd6fc32c9a83d90a9fae78a768043874ad465d1916b3be9fa683')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
