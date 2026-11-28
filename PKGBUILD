# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=defang-bin
pkgver=3.16.1
pkgrel=1
pkgdesc="Develop once, deploy anywhere with Defang"
arch=('x86_64' 'aarch64')
url="https://github.com/DefangLabs/defang"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/DefangLabs/defang/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/defang_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/defang_${pkgver}_linux_arm64.tar.gz")
sha256sums=('247ea7420e81bed3bc84fe0aa8888b25fe7f117bae779c83c3e7756f57fcd391')
sha256sums_x86_64=('c67e74ff53c28bf3319f603a63af770032e54e00cd8ee89bb3ddc31556cb2d62')
sha256sums_aarch64=('af907c94bf9aa2466ebaa642c05a567683453d56eeee700dd77f9ef717a9a9d7')

package() {
  install -Dm755 "defang" "${pkgdir}/usr/bin/defang"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
