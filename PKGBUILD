# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proxsave-bin
pkgver=0.47.1
pkgrel=1
pkgdesc="Configuration backup and disaster recovery for Proxmox VE and PBS hosts"
arch=('x86_64')
url="https://github.com/tis24dev/proxsave"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/proxsave_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('d958a472fd4de201f12e41fe94bf4f0c30d5f70bf78c85075a34c8ef20a4601b')

package() {
  install -Dm755 "proxsave" "${pkgdir}/usr/bin/proxsave"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
