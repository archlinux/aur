# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=caspian-bin
pkgver=0.2.14
pkgrel=1
pkgdesc="Anti-DPI Wi-Fi gateway"
arch=('x86_64' 'aarch64')
url="https://github.com/Iman/caspian"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Iman/caspian/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/caspian-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/caspian-linux-arm64")
sha256sums=('06b332e1fa559c005a0fc8099741d88beb63d2433548c23931d2c396ca41aa72')
sha256sums_x86_64=('ec8510706b91b061d14a3d8af19076b8adb92c02b8702f36f7e6ddb124473201')
sha256sums_aarch64=('f2219ce31406bfd6246ba3bce385f6be7f3d38775bdaa0ef1b2c9e93b31e0a08')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/caspian"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
