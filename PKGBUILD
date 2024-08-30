# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=scarb
pkgname=${_pkgname}-bin
_orgname=software-mansion
_github=${_orgname}/${_pkgname}
pkgver=2.8.1
pkgrel=1
pkgdesc='The Cairo package manager'
arch=('x86_64' 'aarch64')
url='https://docs.swmansion.com/scarb'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ad69962357a30a344dc169511b3e72377cf79cdd958f68cd04f5f969e9012c72')
sha256sums_aarch64=('b8feaf0108946be9980087fef105130cd9b3c9e287be207cc79239210b9bc80d')

package() {
	for each_executable in "scarb" "scarb-cairo-language-server" "scarb-cairo-run" "scarb-cairo-test" "scarb-snforge-test-collector"; do
		install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/${each_executable}" "${pkgdir}/usr/bin/${each_executable}"
	done
	install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/doc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
