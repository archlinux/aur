# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=substreams-bin
pkgver=1.27.0
pkgrel=1
pkgdesc="Blockchain streaming data engine based on Firehose"
arch=('x86_64' 'aarch64')
url="https://github.com/streamingfast/substreams"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/substreams_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/substreams_linux_arm64.tar.gz")
sha256sums_x86_64=('4377aea685925d6b2e384fb920bbe98014916b05ad50d1bd386b05a1f462977d')
sha256sums_aarch64=('c11cf7e5f222a3716747d91306afec5df9504e9ef9feebfd18f0fff1e65aa298')

package() {
  install -Dm755 "substreams" "${pkgdir}/usr/bin/substreams"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
