# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=git-town-bin
pkgver=16.4.1
pkgrel=1
pkgdesc="Git workflow automation to keep branches in sync and reduce merge conflicts.Written in Go.Prebuilt version."
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
sha256sums_aarch64=('5c55f7f8132a63ad2261e7d2ad17d382648de725c5dc39abe973f1d635155504')
sha256sums_x86_64=('093efcdf230267e309227b8c9f8de9af11cec545887401160f964abcae78a49e')
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}