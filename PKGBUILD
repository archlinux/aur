# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gorse-bin
pkgver=0.5.11
pkgrel=1
pkgdesc="AI powered open source recommender system engine supports classical/LLM rankers and multimodal content via embedding"
arch=('x86_64' 'aarch64')
url="https://github.com/gorse-io/gorse"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gorse-io/gorse/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gorse-cli_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/gorse-cli_linux_arm64")
sha256sums=('43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1')
sha256sums_x86_64=('a43c75ecb6f136ea9b982950a0f18224ed11528421602730a17b85d6ab0b9e49')
sha256sums_aarch64=('de29e1e9ebeabee1b80791587198fe1c298dabf0127c939f1947a25c680d768d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gorse-cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
