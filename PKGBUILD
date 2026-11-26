# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hookdeck-cli-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Forward webhooks to localhost and manage Hookdeck Event Gateway resources"
arch=('x86_64' 'aarch64')
url="https://github.com/hookdeck/hookdeck-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/hookdeck_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/hookdeck_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('97baef0b4446e9ef8ba7a8b179f681425656e5059c2b5a86ed067ffdb5f6be78')
sha256sums_aarch64=('ce31d4b580fdcb9804041309efc88c1ca94541a642d8e9c3599dee09355f81f2')

package() {
  install -Dm755 "hookdeck" "${pkgdir}/usr/bin/hookdeck"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
