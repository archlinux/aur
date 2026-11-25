# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=newt-bin
pkgver=1.20.1
pkgrel=1
pkgdesc="Tunneled network connector for Pangolin"
arch=('x86_64' 'aarch64')
url="https://github.com/fosrl/newt"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fosrl/newt/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/newt_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/newt_linux_arm64")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('ac5556844efa38308b54c474c2bb9c512ea13a1c584d0ee1fc9d7b6fee01ddbb')
sha256sums_aarch64=('6a0e7c5775e4cfa1668e554ef2137722533fd7046c2be5495e7d01055c61f6b5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/newt"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
