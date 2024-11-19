# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=scarb
pkgname=${_pkgname}-bin
_orgname=software-mansion
_github=${_orgname}/${_pkgname}
pkgver=2.8.5
pkgrel=1
pkgdesc='The Cairo package manager'
arch=('x86_64' 'aarch64')
url='https://docs.swmansion.com/scarb'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('73e145b3ba803a4fe3d7c21d2418b4fa50ab8b06bec629617fb86e01b6783e7b')
sha256sums_aarch64=('d1bbc6a4b8b1c64fc021c58ea6b5168e1e2fb0a0223ea5e3f16c5aebea9764ba')

package() {
	for each_executable in "scarb" "scarb-cairo-language-server" "scarb-cairo-run" "scarb-cairo-test" "scarb-snforge-test-collector"; do
		install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/${each_executable}" "${pkgdir}/usr/bin/${each_executable}"
	done
	install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/doc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
