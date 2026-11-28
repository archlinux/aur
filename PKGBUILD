# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fault-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Language for building system dynamic models"
arch=('x86_64' 'aarch64')
url="https://github.com/Fault-lang/Fault"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fault_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fault_Linux_arm64.tar.gz")
sha256sums_x86_64=('dda4d7df39a93a0b3ced5c9e1b68c58fde0e5667bdcdc96d98434691b990ca03')
sha256sums_aarch64=('ff0584117536841523802f14cf416e7632d33e94f77fd169d3e997bfa3447df4')

package() {
  install -Dm755 "fault" "${pkgdir}/usr/bin/fault"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
