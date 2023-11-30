# Maintainer: Frank Bearoff fbearoff at gmail dot com

pkgname=marksman-bin
pkgver=2023_11_29
pkgrel=1
pkgdesc='Markdown LSP server providing completion, cross-references, diagnostics, and more'
arch=('x86_64')
url="https://github.com/artempyanykh/${pkgname%-bin}"
license=('MIT')
depends=()
source=("${pkgname}-${pkgver}::${url}/releases/download/${pkgver//_/-}/${pkgname%-bin}-linux-x64"
	"https://raw.githubusercontent.com/artempyanykh/marksman/main/LICENSE")
sha256sums=('9ef848efa86c073830906693609f37b70b93bbbdf797985209679e556fad7b7f'
            'f48413df41ebe5a5f77f997f1f8a0cf5236f24c6878a16e0073da81642aabf04')
options=('!strip')
package() {
	rm -f ${pkgdir}/usr/bin/marksman
	install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
