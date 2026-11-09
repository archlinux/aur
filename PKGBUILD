# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=git-town-bin
pkgver=24.1.1
pkgrel=1
pkgdesc="Git workflow automation to keep branches in sync and reduce merge conflicts.Written in Go."
url="https://www.git-town.com/"
_ghurl="https://github.com/git-town/git-town"
arch=(
	'aarch64'
	'x86_64'
)
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'git'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pkg.tar.zst::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm_64.pkg.tar.zst")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pkg.tar.zst::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_intel_64.pkg.tar.zst")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/git-town/git-town/v${pkgver}/LICENSE")
sha256sums=('eec8a092b92231375231488d27b959e2fa2be80559c97db60c1b0458d3298791')
sha256sums_aarch64=('f44b3c5e459b65d08e864e51261005b060120101921f191bf89a93cf6e329bc2')
sha256sums_x86_64=('966f2ec8b314fdd3e741c4eda4abf1da90a27aaf8319e44ed1c8653bf329550f')
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
