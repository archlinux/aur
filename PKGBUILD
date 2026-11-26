# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goaws-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="AWS SQS and SNS clone for development and testing"
arch=('x86_64' 'aarch64')
url="https://github.com/Admiral-Piett/goaws"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/goaws_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/goaws_Linux_arm64.tar.gz")
sha256sums_x86_64=('091a09d0433b98e4786e5d0c5dd04c0328fba436070b3c24b3b133c217d2ba5c')
sha256sums_aarch64=('a24383485deaa80a4c6334eb73fd55293cc3c6f8b65a903d5e7f5c807f1d0b49')

package() {
  install -Dm755 "goaws" "${pkgdir}/usr/bin/goaws"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
