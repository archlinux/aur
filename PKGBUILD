# Maintainer: Frank Bearoff fbearoff at gmail dot com

pkgname=marksman-bin
pkgver=2022_06_23
pkgrel=1
pkgdesc='Markdown LSP server providing completion, cross-references, diagnostics, and more'
arch=('x86_64')
url="https://github.com/artempyanykh/${pkgname%-bin}"
license=('MIT')
depends=()
source=("${url}/releases/download/${pkgver//_/-}/${pkgname%-bin}-linux"
        "https://raw.githubusercontent.com/artempyanykh/marksman/main/LICENSE")
sha256sums=('d59a8ce3466a9462eba5dc64264fead83c68c0703104998f2bc718bb1cc4ff30'
            'f48413df41ebe5a5f77f997f1f8a0cf5236f24c6878a16e0073da81642aabf04')
options=('!strip')
package() {
  rm -f ${pkgdir}/usr/bin/marksman
  install -Dm755 "marksman-linux" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
