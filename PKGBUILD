# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=poodle-bin
pkgver=2.2.3
pkgrel=1
pkgdesc="Build and run API requests from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/Clivern/Poodle"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/poodle_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/poodle_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('92c5d55d886e66c892fb281e3aae5b72d2275cd663d4556ff5edbe6d29e1065f')
sha256sums_aarch64=('0fe47c7af9552f7683cd1399f38c5e4fdf813812b217b55440bfb7106cfb959a')

package() {
  install -Dm755 "poodle" "${pkgdir}/usr/bin/poodle"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
