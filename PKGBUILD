# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herdr-mirror-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Mirror remote herdr servers into your local sidebar over SSH"
arch=('x86_64' 'aarch64')
url="https://github.com/nikok6/herdr-mirror"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nikok6/herdr-mirror/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/herdr-mirror-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/herdr-mirror-linux-aarch64")
sha256sums=('595b55294e43bcd8382cb690b501bae4368cafb2cde58164b694d2acfec3c950')
sha256sums_x86_64=('15b64b4b93a58e94e70e69b462140699affbb28631737e539cca34bc09e9b628')
sha256sums_aarch64=('798988320567dc0dd1fae8aa733ad6f857f1dc793cfbcf9fa81120af45a7897f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr-mirror"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
