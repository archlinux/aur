# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=gitmux-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.12
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
sha256sums_x86_64=('005952e58675aada77989149f06abca972dd4b5c57e45b020b75fb42425cbc61')
sha256sums_i686=('f1bcf7578f6a1d0301b7e572418a9f7667659d9c43c25c803e30d665d0239f49')
sha256sums_aarch64=('0335b7c7a84fb2889521887af07aa0674393bfcc8cd026fdca1cd08499f8366f')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
