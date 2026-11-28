# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=golinhound-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="BloodHound collector for Linux and SSH attack paths"
arch=('x86_64' 'aarch64')
url="https://github.com/RantaSec/golinhound"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/RantaSec/golinhound/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/golinhound-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/golinhound-linux-arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('3e1f1f552f4a581e31aff60f4b82343ae5230a9d63dc2b14e8b89e74829535bc')
sha256sums_aarch64=('6306f7bc5dd01960114f790ba7a83ef921d4491baae09ea3ef8e484e5602af0b')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/golinhound"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
