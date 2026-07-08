# Maintainer: Jonathan Drolet <jonathan.drolet@gmail.com>
pkgname=slang-server-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="A SystemVerilog language server based on the Slang library"
arch=('x86_64')
url="https://github.com/hudson-trading/slang-server"
license=('MIT')
keywords=('systemverilog' 'verilog' 'hdl' 'language-server' 'lsp')
provides=('slang-server')
conflicts=('slang-server')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hudson-trading/slang-server/releases/download/v${pkgver}/slang-server-linux-x64.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/hudson-trading/slang-server/v${pkgver}/LICENSE")
sha256sums=('8559c84d01b4357806c6c05d247d82051278d3bfeb1cf26594f7d5da4417d167'
  'SKIP')

package() {
  # Install the binary
  install -Dm755 "${srcdir}/slang-server" "${pkgdir}/usr/bin/slang-server"

  # Install license
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
