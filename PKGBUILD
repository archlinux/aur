# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=l3afd-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Control plane for eBPF programs"
arch=('x86_64')
url="https://github.com/l3af-project/l3afd"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/l3af-project/l3afd/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/l3afd-v${pkgver}-linux-x86_64.zip")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('08b987f90fbd26d39ee21b4f624dac2a85d77d0a0915fd82efba28dad99e91b3')

package() {
  install -Dm755 "l3afd" "${pkgdir}/usr/bin/l3afd"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
