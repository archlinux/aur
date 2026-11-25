# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=watchvuln-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Collect high-value vulnerability alerts and push them to messaging services"
arch=('x86_64' 'aarch64')
url="https://github.com/zema1/watchvuln"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zema1/watchvuln/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/watchvuln-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/watchvuln-linux-arm64")
sha256sums=('5b7811ea5434fa0d6af9cd9e40d54f91d28bf52cb208a3c553695439722a736d')
sha256sums_x86_64=('583fa671b73dee6137b749194450dc4d174e1c542cfe734245fa8da191f96607')
sha256sums_aarch64=('f8d20df466540dde6a26089aa62166b2ed1958ae8c8780fc6945b5aebc0b5e03')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/watchvuln"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
