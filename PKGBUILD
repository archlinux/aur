# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dlayer-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Docker image layer analyzer"
arch=('x86_64' 'aarch64')
url="https://github.com/orisano/dlayer"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dlayer_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dlayer_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('21664bbbde8b7fd6bdf17d9aa72c63aff49c3c4041d14caadabbabc3cbbac45c')
sha256sums_aarch64=('760360483d2ab217582dcffeee1431f5f98d55053d3d9defbde361f59c1f2184')

package() {
  install -Dm755 "dlayer" "${pkgdir}/usr/bin/dlayer"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
