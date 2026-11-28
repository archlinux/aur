# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=floe-bin
pkgver=1.12.7
pkgrel=1
pkgdesc="Encrypted peer-to-peer file transfer with no accounts or uploads"
arch=('x86_64' 'aarch64')
url="https://github.com/jannskiee/floe"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/floe_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/floe_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0175e78e53918b4f93afc335db2c353ae0a6e16571b3ed796eceeac4e0e4715a')
sha256sums_aarch64=('70c248d8b25fea94a39fd0832babd9b4f973a2f7dcc0e74372be49e3c1c42dab')

package() {
  install -Dm755 "floe" "${pkgdir}/usr/bin/floe"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
