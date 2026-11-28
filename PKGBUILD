# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gokvm-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="Tiny KVM-based x86 hypervisor that boots Linux"
arch=('x86_64')
url="https://github.com/bobuhiro11/gokvm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gokvm_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('346f5de8344907088987808c46672b05487816e35ab581b3a15928453475a461')

package() {
  install -Dm755 "gokvm" "${pkgdir}/usr/bin/gokvm"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
