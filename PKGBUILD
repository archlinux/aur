# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=restoredrill-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Verify that PostgreSQL and MySQL backups actually restore"
arch=('x86_64' 'aarch64')
url="https://github.com/ahmadpiran/restoredrill"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/restoredrill_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/restoredrill_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5c9d4ce3528d6622e390348d30081d4841e854fcdab21186e8521854b19f276c')
sha256sums_aarch64=('c0214786bd14570e58eb22bc4626f6aa1266dc1985ed7d4fff378e674744bb81')

package() {
  install -Dm755 "restoredrill" "${pkgdir}/usr/bin/restoredrill"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
