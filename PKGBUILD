# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=octopool-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Shared, org-authenticated GitHub read relay and cache"
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/octopool"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/octopool_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/octopool_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('caf4708e7b57e72bd2427dfc8e6f870f2cedb22024fe1a32e855b4167976e822')
sha256sums_aarch64=('fcdbcf1f94159878b427d5f65629a23030bf7b6f67a6df792013304bf7651a48')

package() {
  install -Dm755 "octopool" "${pkgdir}/usr/bin/octopool"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
