# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=showboat-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Create executable documents that demonstrate an agent's work"
arch=('x86_64' 'aarch64')
url="https://github.com/simonw/showboat"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/simonw/showboat/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/showboat-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/showboat-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('45092381d6507a5fb127b88dbc79e88970793364f95c6c981700526e477fb7a1')
sha256sums_aarch64=('ad275d855aea1530174c65720b504ff60965e07e37f81e092c551ba86c7af680')

package() {
  install -Dm755 "showboat" "${pkgdir}/usr/bin/showboat"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
