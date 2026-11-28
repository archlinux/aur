# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dgxtop-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Terminal monitor for NVIDIA GPUs and DGX Spark systems"
arch=('x86_64' 'aarch64')
url="https://github.com/DennySORA/dgxtop"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/DennySORA/dgxtop/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dgxtop-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dgxtop-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('bbc0e4bc702f97b9b92aec32f6f3fc02e0b96c7525cfec5a1bab83f094cfe32c')
sha256sums_aarch64=('db09c3b56946391e27049577e429a1d825ee950bb6acf336a2ab6a93f839ec6a')

package() {
  install -Dm755 "dgxtop" "${pkgdir}/usr/bin/dgxtop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
