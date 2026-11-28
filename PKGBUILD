# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=paygate-bin
pkgver=0.10.4
pkgrel=1
pkgdesc="RESTful API for submitting and receiving ACH payments"
arch=('x86_64')
url="https://github.com/moov-io/paygate"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/moov-io/paygate/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/paygate-linux-amd64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('7fadbed033bc46eb660c5fa107930742111c44f51657cbf72e95748641e31b12')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/paygate"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
