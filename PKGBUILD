# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=outl-bin
pkgver=0.13.7
pkgrel=1
pkgdesc="Local-first outliner"
arch=('x86_64' 'aarch64')
url="https://github.com/outlmd/outl"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/outl-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/outl-linux-arm64.tar.gz")
sha256sums_x86_64=('83716cdf66a206f7491016271b6ee9232c7baad80805f7fbab855b3b945c58f6')
sha256sums_aarch64=('ded2438d33a411bc9155792baa83812c13fa23998a0bfd86814be3b7f19c6e7a')

package() {
  install -Dm755 "outl" "${pkgdir}/usr/bin/outl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
