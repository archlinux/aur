# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=gitmux-bin
_pkgname="${pkgname%-bin}"
pkgver=0.11.5
pkgrel=1
pkgdesc="Git in your tmux status bar"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/arl/gitmux"
license=('MIT')
depends=('tmux')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d46a10f5fe07ab5b8a902ac29c937e4d3c8d7f33ea30fa335d682601697b5a71')
sha256sums_i686=('0fad997bcfe95f073dab2cf70b0f9b40b91d0578aa4d8e278b4f67a2c70ac7d5')
sha256sums_aarch64=('89a03a76828267927d57904f0f716a9b9aad627d1697d5c0c883d60c09bb4ff6')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
