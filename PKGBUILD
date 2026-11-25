# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=suo5-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="High-performance HTTP tunneling tool"
arch=('x86_64' 'aarch64')
url="https://github.com/zema1/suo5"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zema1/suo5/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/suo5-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/suo5-linux-arm64")
sha256sums=('5b7811ea5434fa0d6af9cd9e40d54f91d28bf52cb208a3c553695439722a736d')
sha256sums_x86_64=('629dc3e537d611e2da7e5e0274900213e817d4057b344e6cb82bd95dee937d3b')
sha256sums_aarch64=('06ce70daa0b33a2abfbac790a8923df732dcd2b524a107763b8ac77df4fc6842')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/suo5"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
