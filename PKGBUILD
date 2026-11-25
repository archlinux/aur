# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chanify-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Simple and safe push notification service"
arch=('x86_64' 'aarch64')
url="https://github.com/chanify/chanify"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chanify_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/chanify_Linux_arm64.tar.gz")
sha256sums_x86_64=('03304f710cf2683b72bfaf8112a3907ed6335e4dd56bb85cc9d2c211dd1b21fd')
sha256sums_aarch64=('8dece746cb74d50242f5d469c66762ec4aa6106c28a9f9de530f1b7e35ca2e72')

package() {
  install -Dm755 "chanify" "${pkgdir}/usr/bin/chanify"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
