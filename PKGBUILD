# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=builder-playground-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Self-contained environment for end-to-end block building on L1s and L2s"
arch=('x86_64' 'aarch64')
url="https://github.com/flashbots/builder-playground"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/flashbots/builder-playground/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/builder-playground_v${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/builder-playground_v${pkgver}_linux_arm64.zip")
sha256sums=('6fd2774c043906b295462805cc547877a5abb796b3bc8bce38799f77571c866f')
sha256sums_x86_64=('e6e0e0c631e5181783d949e28e56339fa7565f54406830f6f78fbb68838a661d')
sha256sums_aarch64=('f7df45631071bc5f88f89d46333ecd7c178fb368fd433d8c69d5f9e55e7d4d56')

package() {
  install -Dm755 "builder-playground" "${pkgdir}/usr/bin/builder-playground"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
