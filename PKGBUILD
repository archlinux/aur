# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cpos-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Fetch Codeforces and CSES problems, run tests and submit from the terminal"
arch=('x86_64')
url="https://github.com/Soham109/cpos"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Soham109/cpos/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cpos-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8217f722ca8d2c53c3c21ca8dda88d3bc408d1f603a7aab0f0c5c930fd9676b0')
sha256sums_x86_64=('49b33d373dbe28aab227a296db20622a0acccb2a33e8af22b04d1da9e7e96dc2')

package() {
  install -Dm755 "cpos" "${pkgdir}/usr/bin/cpos"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
