# Maintainer: Frank Bearoff fbearoff at gmail dot com

pkgname=marksman-bin
pkgver=2022_08_28
pkgrel=1
pkgdesc='Markdown LSP server providing completion, cross-references, diagnostics, and more'
arch=('x86_64')
url="https://github.com/artempyanykh/${pkgname%-bin}"
license=('MIT')
depends=()
source=("${pkgname}-${pkgver}::${url}/releases/download/${pkgver//_/-}/${pkgname%-bin}-linux"
        "https://raw.githubusercontent.com/artempyanykh/marksman/main/LICENSE")
sha256sums=('853b1f5620f04c4f3b12c922862b3adfae1b51342b6a33d49ea5856eb0bc7361'
            'f48413df41ebe5a5f77f997f1f8a0cf5236f24c6878a16e0073da81642aabf04')
options=('!strip')
package() {
  rm -f ${pkgdir}/usr/bin/marksman
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
