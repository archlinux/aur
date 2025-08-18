# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=git-town-bin
pkgver=21.4.3
pkgrel=1
pkgdesc="Git workflow automation to keep branches in sync and reduce merge conflicts.Written in Go.(Prebuilt version)"
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
sha256sums_aarch64=('e2f12a13fa779acefddf9f639dd26afbf17f85d7b12c1e654c880545069b3787')
sha256sums_x86_64=('0f3dea409ab967c3e12a51e423692162165c2a9fff901cd252660cdd86a77d17')
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
