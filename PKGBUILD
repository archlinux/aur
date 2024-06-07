# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=git-town-bin
pkgver=14.2.2
pkgrel=1
pkgdesc="Git workflow automation to keep branches in sync and reduce merge conflicts."
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm_64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_intel_64.deb")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/git-town/git-town/v${pkgver}/LICENSE")
sha256sums=('eec8a092b92231375231488d27b959e2fa2be80559c97db60c1b0458d3298791')
sha256sums_aarch64=('0467cfd820205687ee94262712c63a6df71138d4256babd99e3a8c7d5960b2cd')
sha256sums_x86_64=('fe3cc07d343b934f82506ab38e15f7730308909a681fe76bf28d9a35cb5cc724')
build() {
	bsdtar -xf "${srcdir}/data."*
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
