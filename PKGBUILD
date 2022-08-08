# Maintainer: Frank Bearoff fbearoff at gmail dot com

pkgname=marksman-bin
pkgver=2022_08_07
pkgrel=1
pkgdesc='Markdown LSP server providing completion, cross-references, diagnostics, and more'
arch=('x86_64')
url="https://github.com/artempyanykh/${pkgname%-bin}"
license=('MIT')
depends=()
source=("${url}/releases/download/${pkgver//_/-}/${pkgname%-bin}-linux"
        "https://raw.githubusercontent.com/artempyanykh/marksman/main/LICENSE")
sha256sums=('3996274cecc3a8fc1d27d35c741d85b6964f49888e2e9e73cfae214ad96ba7d8'
            'f48413df41ebe5a5f77f997f1f8a0cf5236f24c6878a16e0073da81642aabf04')
options=('!strip')
package() {
  rm -f ${pkgdir}/usr/bin/marksman
  install -Dm755 "marksman-linux" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
