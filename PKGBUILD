# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kmp-lsp-bin
pkgver=0.27.0
pkgrel=1
pkgdesc="Fast, low-memory language server for Kotlin and Java"
arch=('x86_64' 'aarch64')
url="https://github.com/Hessesian/kmp-lsp"
license=('MIT')
depends=('glibc' 'libgcc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Hessesian/kmp-lsp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kmp-lsp-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kmp-lsp-linux-aarch64.tar.gz")
sha256sums=('f37d6386bb71399629be79efca0d9fe85fcc3014bc2ae69b400b3e66ae5b8bcf')
sha256sums_x86_64=('c14e09971ee5f53895aa6bc30242fdbcc3580aae751c39899923aee1a3962492')
sha256sums_aarch64=('4d5cad21ecfb823d15b9cecfc47bfd78717c81962ba786f34d35b0a04277dee7')

package() {
  install -Dm755 "kmp-lsp" "${pkgdir}/usr/bin/kmp-lsp"
  install -Dm755 "kmp-jar-indexer" "${pkgdir}/usr/bin/kmp-jar-indexer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
