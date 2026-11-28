# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=screp-bin
pkgver=1.13.9
pkgrel=1
pkgdesc="StarCraft: Brood War replay parser"
arch=('x86_64')
url="https://github.com/icza/screp"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/icza/screp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/screp-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('c23b3fbf15dd74754fb5ee05d04bd1ea3fb8867a89c5f8610a16bac832bfaf36')
sha256sums_x86_64=('873c95ee5b985aae1f25139af69fc214dce14623b4bb8c5e9c9a90ca79bfc7ae')

package() {
  install -Dm755 "screp" "${pkgdir}/usr/bin/screp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
