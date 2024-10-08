# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=scarb
pkgname=${_pkgname}-bin
_orgname=software-mansion
_github=${_orgname}/${_pkgname}
pkgver=2.8.4
pkgrel=1
pkgdesc='The Cairo package manager'
arch=('x86_64' 'aarch64')
url='https://docs.swmansion.com/scarb'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('19b6e70be85657bae5e4e0313af0ad06e87d4efe294d9d4dafd448e0383896a8')
sha256sums_aarch64=('360c8934608d3e3970f626e77625ade8cbf8beb0bcdce235fa08aedb0ffa2714')

package() {
	for each_executable in "scarb" "scarb-cairo-language-server" "scarb-cairo-run" "scarb-cairo-test" "scarb-snforge-test-collector"; do
		install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/${each_executable}" "${pkgdir}/usr/bin/${each_executable}"
	done
	install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/doc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
