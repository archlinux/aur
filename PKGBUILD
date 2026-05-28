# Maintainer: Jonathan Drolet <jonathan.drolet@gmail.com>
pkgname=slang-server-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="A SystemVerilog language server based on the Slang library"
arch=('x86_64')
url="https://github.com/hudson-trading/slang-server"
license=('MIT')
keywords=('systemverilog' 'verilog' 'hdl' 'language-server' 'lsp')
provides=('slang-server')
conflicts=('slang-server')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hudson-trading/slang-server/releases/download/v${pkgver}/slang-server-linux-x64-gcc.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/hudson-trading/slang-server/v${pkgver}/LICENSE")
sha256sums=('ed807fb6c9fd974a402f7ea04ab15e9a8c9d204303c9b6428af51c06f1ea0b04'
  'SKIP')

package() {
  # Install the binary
  install -Dm755 "${srcdir}/slang-server" "${pkgdir}/usr/bin/slang-server"

  # Install license
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
