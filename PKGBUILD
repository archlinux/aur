# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=code-graph-rag-bin
pkgver=0.7.129
pkgrel=1
pkgdesc="The ultimate RAG for your monorepo"
arch=('x86_64')
url="https://github.com/vitali87/code-graph-rag"
license=('MIT')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vitali87/code-graph-rag/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/code-graph-rag-linux-amd64")
sha256sums=('b0c4bc8ac9df66d9d0a9d204af48b5cba2e7d469c2ff6ab51512de5e31319963')
sha256sums_x86_64=('250e6a90111cb0b51ec7b6f7ed9d351daccf039dd4abf3d828d2f6b7c42ce76f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/code-graph-rag"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
