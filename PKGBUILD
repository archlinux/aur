# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=digcrawl-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Local-first content crawler for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/originaleric/digcrawl"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/digcrawl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/digcrawl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f6b3b6226577d7da63ff75ae5c3fffa1e0ebbb6077ad719e9f9fb37689353548')
sha256sums_aarch64=('2e206ead503c16914e3cac764d3bd68e53aa4e9aafcfba991071635f69a47fe2')

package() {
  install -Dm755 "digcrawl" "${pkgdir}/usr/bin/digcrawl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
