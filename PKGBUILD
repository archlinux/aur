# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dexdec-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Android decompiler for humans and AI agents"
arch=('x86_64')
url="https://github.com/asLody/dexdec"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/DexDec-${pkgver}-cli-linux-x86_64.tar.gz")
sha256sums_x86_64=('112d52b93920fc1b2c32070ef934b7731b9138a154710fe9b1b4e2fb6f2ca2a6')

package() {
  install -Dm755 "DexDec-${pkgver}-cli-linux-x86_64/dexdec-mcp" "${pkgdir}/usr/bin/dexdec-mcp"
  install -Dm755 "DexDec-${pkgver}-cli-linux-x86_64/dexdec" "${pkgdir}/usr/bin/dexdec"
  install -Dm644 "DexDec-${pkgver}-cli-linux-x86_64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "DexDec-${pkgver}-cli-linux-x86_64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
