# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='prm'
pkgver=v2.4.1
pkgrel=1
pkgdesc='Pull Request Manager for Maintainers'
url='https://github.com/ldez/prm'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('APACHE')

provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")

depends=('git')
makedepends=()

_basedownloadurl="${url}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('023be9cc6b7d76e5f81f41e1a59eeab26bff971b6dffee7617b01f91d0e90f34')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('68b05521064890b69edadeae79f1ee308efac1116b1c9eb361bb8ebb10802722')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('ffa160b87a472a9c25dfb8d0b26f37d0d272c04fd4126a629d48d754e9a623af')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('9f7abe913214c8c20ab7a15f1ca5834b8c89bd0d9f91f2f0988050e3d477e3e0')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
