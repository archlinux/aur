# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openrisk-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Generate a risk score from Nuclei scan results"
arch=('x86_64' 'aarch64')
url="https://github.com/projectdiscovery/openrisk"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/openrisk_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/openrisk_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('4acef7d8d366b4631fe60e161f7eb42c31e43da528e7bf741acb5de799f3f810')
sha256sums_aarch64=('16e6027d68707c961fe17855ead4fc35bdf159156314493c3f12d88c35a16f1f')

package() {
  install -Dm755 "openrisk" "${pkgdir}/usr/bin/openrisk"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
