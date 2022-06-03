# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=air-bin
pkgver=1.30.0
pkgrel=1
pkgdesc="Live reload for Go apps"
url="https://github.com/cosmtrek/${pkgname%-bin}"
arch=('x86_64' 'i686' 'aarch64')
license=(GPL3)
depends=(go)
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname/-bin/}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${pkgname/-bin/}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${pkgname/-bin/}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('ccbf0b6a26d4375d6aea28399cdb3df3cd2e44e7fcf33aae9d019db2a5461c21')
sha256sums_i686=('8c79dbfee2e963e9d70800197dfebd518fb13e3bffd77c1cb88e354d96616f7d')
sha256sums_aarch64=('721cc6fa815471f010360061e5dec66db91432bf20549aae60c516fb190bef37')

package() {
  install -Dvm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
