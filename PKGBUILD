# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sower-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Cross-platform transparent proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/sower-proxy/sower"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sower-proxy/sower/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sower-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sower-linux-arm64.tar.gz")
sha256sums=('815ce12a7b01d1634356e74d364e57c24434dc270f2f837332dafd9c3e9ed3d5')
sha256sums_x86_64=('90641656b1d9e61df1eb8d15b7190c12b508fbff7c69b602a8add01d8cc864a4')
sha256sums_aarch64=('bb8393765b589bb57c4b4ae6957eb4615b6f61e812b087d605df140507c4659d')

package() {
  install -Dm755 "sower" "${pkgdir}/usr/bin/sower"
  install -Dm755 "sowerd" "${pkgdir}/usr/bin/sowerd"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
