# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sage-wiki-bin
pkgver=0.2.13
pkgrel=1
pkgdesc="Graph memory and knowledge base shared by AI agents and humans"
arch=('x86_64' 'aarch64')
url="https://github.com/xoai/sage-wiki"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sage-wiki_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sage-wiki_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0eda9176a0ef5c4a7f1fad60ce2e376261d243a110e5430172cdacf0673ef6ce')
sha256sums_aarch64=('7b81789dabb39c6c5ebc684fa5fbcc122ae59f907c7f98aa11cf7459a2c82c29')

package() {
  install -Dm755 "./sage-wiki" "${pkgdir}/usr/bin/sage-wiki"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
