# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=digcrawl-bin
pkgver=1.0.5
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
sha256sums_x86_64=('199628fc065fba670227f09b4b5f7bb7f12872ba62fb43d52074c4a59e887b6b')
sha256sums_aarch64=('e7b5c072d6923eb6b77e7459f65549caf55ed65935945974778111e223135d89')

package() {
  install -Dm755 "digcrawl" "${pkgdir}/usr/bin/digcrawl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
