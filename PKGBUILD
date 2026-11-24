# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=trx-pkg-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="TUI package manager"
arch=('x86_64')
url="https://github.com/pie-314/trx"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'trx' 'trx-bin')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pie-314/trx/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/trx-linux-x86_64.tar.gz")
sha256sums=('3515d6f214d63cd29ebb6b7b9194c447e58092e28f7a448a7159246caa565c2b')
sha256sums_x86_64=('373bb777be02519a946482888bdd7a53dc4973c833fac2f41b8a548098da9321')

package() {
  install -Dm755 "trx" "${pkgdir}/usr/bin/trx"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
