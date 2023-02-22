# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego-bin'
_pkgname="${pkgname%-bin}"
pkgver=4.10.0
pkgrel=1
pkgdesc='Lets Encrypt client and ACME library written in Go'
url='https://go-acme.github.io/lego/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}-git" "${_pkgname}")

depends=()
makedepends=()

_url='https://github.com/go-acme/lego'
_basedownloadurl="${_url}/releases/download/v${pkgver}"
_basearchive="${_pkgname}_v${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('cc1867d0e4e1ca4c6f545f8311e7a4b7150ce02d22c704a64d1f5c545c2ef7f0')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('346e08d96b767d8d05f450ebf916e998218bd8a5cba4893c4d132ff81c8e21c6')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('bf0e58cd484f8c96ab52e65005f28ae7fe044c724657b8ceefd70389b36b4669')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('c3fd130a34171863c1a3d9a48791d369e276eea9a0f0a720a6868466371fdfc6')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
