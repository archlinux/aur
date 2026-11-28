# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=reckoner-bin
pkgver=6.3.1
pkgrel=1
pkgdesc="Declaratively install and manage multiple Helm chart releases"
arch=('x86_64' 'aarch64')
url="https://github.com/FairwindsOps/reckoner"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/reckoner_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/reckoner_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e507637f6c8e052c88ef19567c2b9ca7b5e9dbf05fb40b652804111493bb27da')
sha256sums_aarch64=('7f17ffea008c321624b4c89ee860ed6bfb5f4e563857405c5717f5d2e21db481')

package() {
  install -Dm755 "reckoner" "${pkgdir}/usr/bin/reckoner"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
