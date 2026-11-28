# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tenuo-bin
pkgver=0.3.9
pkgrel=1
pkgdesc="Task-scoped authorization for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/tenuo-ai/tenuo"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tenuo-ai/tenuo/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tenuo-authorizer-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tenuo-authorizer-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('1ef0b0059066d410f58a0e85313b2c915b00c6e3353099626fa3e7433a5470c8')
sha256sums_aarch64=('5f8cfc890ecf91ea6f287b3875dad05de33b71d7cddf74161eb12a0c54869c48')

package() {
  install -Dm755 "tenuo-authorizer" "${pkgdir}/usr/bin/tenuo-authorizer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
