# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=code-index-mcp-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="Code index MCP server with tree-sitter AST for many languages, including 1C/BSL"
arch=('x86_64')
url="https://github.com/Regsorm/code-index-mcp"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Regsorm/code-index-mcp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/code-index-linux-x64.tar.gz")
sha256sums=('7e32822f6b8fc59ca4269cfc3fbb54aa7001da3833c506b695e2bdbfcabafe8b')
sha256sums_x86_64=('f1270fa98f92b14bf55c5b15e62ad52395734a5e341c2f3322c1ada8e8252bc4')

package() {
  install -Dm755 "code-index" "${pkgdir}/usr/bin/code-index"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
