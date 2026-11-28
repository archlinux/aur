# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=framed-bin
pkgver=0.0.9
pkgrel=1
pkgdesc="Manage project file and directory structure"
arch=('x86_64' 'aarch64')
url="https://github.com/mactat/framed"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/framed_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/framed_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1139b193ac48dc340bfb4707b231207ec5c72be53c171b1d9579ce8838af9245')
sha256sums_aarch64=('04ade00870e8688f7769b7fea3d4a04cfff753f60ebad19985df34941a78fb48')

package() {
  install -Dm755 "framed" "${pkgdir}/usr/bin/framed"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
