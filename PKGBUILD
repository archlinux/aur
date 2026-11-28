# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=minectl-bin
pkgver=0.61.0
pkgrel=1
pkgdesc="Create Minecraft servers on different cloud providers"
arch=('x86_64' 'aarch64')
url="https://github.com/dirien/minectl"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/minectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/minectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('56022dda6c979dc8649bdfde5df20cbbbff630980b65563938b8d35ce9e5ca84')
sha256sums_aarch64=('af1cfb6497d2b478efc885b46e2937f0fb59dc51b273ec631d8ba7c553ebe66e')

package() {
  install -Dm755 "minectl" "${pkgdir}/usr/bin/minectl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
