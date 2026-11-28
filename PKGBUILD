# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ai00_server-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="RWKV inference server with embeddings, RAG and agents"
arch=('x86_64')
url="https://github.com/Ai00-X/ai00_server"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/ai00_server-v${pkgver}-x86_64-unknown-linux-gnu.zip")
sha256sums_x86_64=('495caf121dd4ba9d390be3f80047b362b28618a38f975df91a6d3b4a303533d8')

package() {
  install -Dm755 "dist/ai00-server" "${pkgdir}/usr/bin/ai00-server"
  install -Dm644 "dist/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "dist/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
