# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dashbrr-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Dashboard for monitoring and managing media stack services"
arch=('x86_64' 'aarch64')
url="https://github.com/autobrr/dashbrr"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dashbrr_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dashbrr_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7dc6e43c76a106fc8554bc3ef9b49babe76f5191d675d5634d1f334bc330a60c')
sha256sums_aarch64=('52eb560f3a3687685a3b65768fd330ed4c53fbb41158c4fd845d6de9f6b6996f')

package() {
  install -Dm755 "dashbrr" "${pkgdir}/usr/bin/dashbrr"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
