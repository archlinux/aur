# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=procfd-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="List open file descriptors of processes, an lsof replacement"
arch=('x86_64')
url="https://github.com/deshaw/procfd"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/deshaw/procfd/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/procfd-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c15cbb5df4f16c3674d166a7b49f1d2b387f0e01f074771f7ca0ad13e9e09370')
sha256sums_x86_64=('ba0849e7195219c94107683f1d0cf005aa5e150ac5be349aca40582a33a39998')

package() {
  install -Dm755 "procfd" "${pkgdir}/usr/bin/procfd"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
