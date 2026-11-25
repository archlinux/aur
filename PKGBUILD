# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=polodb-bin
pkgver=5.3.0
pkgrel=1
pkgdesc="Embedded document database with a MongoDB-like API"
arch=('x86_64')
url="https://github.com/PoloDB/PoloDB"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/PoloDB/PoloDB/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/polodb-linux-x64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('d1e361ab63dc16da45ed6a9e9d96acb17d356915858b24d757092989e9a9ac60')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/polodb"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
