# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=skill-up-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Evaluate AI agent skills and environments"
arch=('x86_64' 'aarch64')
url="https://github.com/alibaba/skill-up"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/skill-up_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/skill-up_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('792f74a59f9c5aeafbefab292009aa1602b21b14610d92369cf4649078fd234b')
sha256sums_aarch64=('6d36fac9c35dcdec28fc8c1843da2e31955061c995da98ac9305ff6d7fa5f384')

package() {
  install -Dm755 "skill-up" "${pkgdir}/usr/bin/skill-up"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
