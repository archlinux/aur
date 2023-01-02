# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=gitmux-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.10
pkgrel=2
pkgdesc="Git in your tmux status bar"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/arl/gitmux"
license=('MIT')
depends=('tmux')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('99d25aa57d2b255a1969b1c068121702dcce019de5f8c23bf398a1f6e520ffb5')
sha256sums_i686=('6d009c6dc467cf8138a3b3a26fc7aa001911a10bf8b3b7f15a19e81f75052301')
sha256sums_aarch64=('a7209f9ef368e5e723ddb5719bc05b09ce119af4a91965a5fb90f3ca5036cc68')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
