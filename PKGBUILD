# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=playconsole-cli-bin
pkgver=0.5.17
pkgrel=1
pkgdesc="Scriptable command-line client for Google Play Console"
arch=('x86_64' 'aarch64')
url="https://github.com/AndroidPoet/playconsole-cli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/playconsole-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/playconsole-cli_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4e514d021ab1b219c696c0d48e711d2f9a2419c8bfa3d75d2df3b8424c9ae716')
sha256sums_aarch64=('cb9f4f376ba1a2d1f1e3aa99af95db886c97cdc18321016533425e6ad40e7d91')

package() {
  install -Dm755 "playconsole-cli" "${pkgdir}/usr/bin/playconsole-cli"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
