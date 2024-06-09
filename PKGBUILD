# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=gitmux-bin
_pkgname="${pkgname%-bin}"
pkgver=0.11.2
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
sha256sums_x86_64=('b8af2d611e424d45ff9f9d8fbe7e8066b87b1b5e675a476bfb08f7ae55d1c318')
sha256sums_i686=('b9e0ecb28198bbc147b38e0c3ad1bc6fd5f8e7a5ca38c90a72c463bba360b7b5')
sha256sums_aarch64=('42b07c088bf4c73f9ffe00d5c2b4fe3a3f272105de2e5c7e2d95de4857deaa80')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
