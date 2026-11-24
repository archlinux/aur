# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tblogs-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Terminal reader for developer blogs"
arch=('x86_64')
url="https://github.com/ezeoleaf/tblogs"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ezeoleaf/tblogs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/tblogs-linux-amd64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('912beadb17290aa091c08d2f5a4072d44c793b5a5515843215a6b16edc11aece')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tblogs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
