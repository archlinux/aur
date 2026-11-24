# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=perfdeck-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Customizable TUI performance monitor"
arch=('x86_64' 'aarch64')
url="https://github.com/sumant1122/perfdeck"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/perfdeck_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/perfdeck_Linux_arm64.tar.gz")
sha256sums_x86_64=('25f64228b696f339d5c1d89c6251a5ced23caf9c244402506baf7a197ce38f45')
sha256sums_aarch64=('600d6573ecca8c938dc6b7bfaff2ed286b43b090453c16b029c92e3d2fc80bb2')

package() {
  install -Dm755 "perfdeck" "${pkgdir}/usr/bin/perfdeck"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
