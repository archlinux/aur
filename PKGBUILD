# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='prm'
pkgver=v3.3.0
pkgrel=1
pkgdesc='Pull Request Manager for Maintainers'
url='https://ldez.github.io/prm/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('APACHE')

provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")

depends=('git')
makedepends=()

_repourl='https://github.com/ldez/prm'
_basedownloadurl="${_repourl}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('88acc06ceafe8b462a0ed26c41d4dcc5a73ba55fb5dbdff94ff6e2641626159c')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('6b29239c61c241a1492bc61747b666aef4fdd641a79c47bf813e8d9360decf2a')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('97fef5a545ab605d686d54d4978020e3b1e9aa3ecde72fd8ca2fd910ca42e93d')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('a99dbd0604adf0c8a1f0d4f1ecdc8aed2405b916aa82fb00571a89e00ff88a06')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
