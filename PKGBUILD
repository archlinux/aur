# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=scarb
pkgname=${_pkgname}-bin
_orgname=software-mansion
_github=${_orgname}/${_pkgname}
pkgver=2.6.5
pkgrel=1
pkgdesc='The Cairo package manager'
arch=('x86_64' 'aarch64')
url='https://docs.swmansion.com/scarb'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/scarb-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/${_github}/releases/download/v${pkgver}/scarb-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4a48d89e48bb8cf8c9ca13dda6b68e303ddf0743a6921483e7bd93c04e989437')
sha256sums_aarch64=('a82386ad80e6944ca56c681162f94243559635d227364f2f4e7057e4464c97f5')

package() {
	for each_executable in "scarb" "scarb-cairo-language-server" "scarb-cairo-run" "scarb-cairo-test" "scarb-snforge-test-collector"; do
		install -Dm755 "${srcdir}/scarb-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/${each_executable}" "${pkgdir}/usr/bin/${each_executable}"
	done
	install -Dm644 "${srcdir}/scarb-v${pkgver}-${CARCH}-unknown-linux-gnu/doc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
