# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=gitmux-bin
_pkgname="${pkgname%-bin}"
pkgver=0.11.1
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
sha256sums_x86_64=('32b29a0627eb8abe68d29bc3a4f3a175870df8cc080dcf6ac888bd504a877f10')
sha256sums_i686=('10a57a79dbccf06cf778db3caf50858e5a8e728a23fa58befe98ee01ca1062ea')
sha256sums_aarch64=('546cf8e6ae7a9879e6e49f83b7e831fc39eca2b29efac8c0151cc971efdb4248')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
