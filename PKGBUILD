# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lsp-proxy-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="LSP client backend for Emacs"
arch=('x86_64' 'aarch64')
url="https://github.com/jadestrong/lsp-proxy"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lsp-proxy-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lsp-proxy-linux-arm64.tar.gz")
sha256sums_x86_64=('2bbefae2f8b4a73f30da2cfc4abf1bed763a0d5a55c74e4d45f59a03467485ba')
sha256sums_aarch64=('767b789aee36f0ee379bee8fb16131267b744ed65009d2f7f63e4d6b335fa83d')

package() {
  install -Dm755 "emacs-lsp-proxy" "${pkgdir}/usr/bin/emacs-lsp-proxy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
