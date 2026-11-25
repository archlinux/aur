# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clother-bin
pkgver=3.0.12
pkgrel=1
pkgdesc="Use multiple Claude Codecompatible LLM providers from one CLI, switching profiles instantly with simple clother-* commands"
arch=('x86_64' 'aarch64')
url="https://github.com/jolehuit/clother"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jolehuit/clother/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clother_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clother_linux_arm64.tar.gz")
sha256sums=('16c2da22dc5c242465eaba4c16c7638690937aaacf20acf5a94a5ab678ddc40f')
sha256sums_x86_64=('6fce42d6f0b66c5c6b02540e61446ecfcf20b49bd8c824a7d2e55f5999353889')
sha256sums_aarch64=('7bb1e54c1181b8e4063fca8d56149c6d9484cf246fbb20bab93c4aa4a2e7695f')

package() {
  install -Dm755 "clother" "${pkgdir}/usr/bin/clother"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
