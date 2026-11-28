# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=horust-bin
pkgver=0.1.14
pkgrel=1
pkgdesc="Supervisor and init system for containers"
arch=('x86_64' 'aarch64')
url="https://github.com/FedericoPonzi/Horust"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/FedericoPonzi/Horust/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/horust-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/horust-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('6d9618260b1eb01f242f942b89deca8bea1e68543fc8ee861808e214c5147d66')
sha256sums_x86_64=('55358d26c0e3006990f598962ad67c2927008cc84c28782437625ab6a7fb2386')
sha256sums_aarch64=('bc5e5d592efd447c17ca51b23dcbc20178278e7717eb9499325f066ea3aa4bd4')

package() {
  install -Dm755 "horust" "${pkgdir}/usr/bin/horust"
  install -Dm755 "horustctl" "${pkgdir}/usr/bin/horustctl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
