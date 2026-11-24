# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=schema-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Database CLI with migrations, a studio and an LSP"
arch=('x86_64' 'aarch64')
url="https://github.com/gigagrug/schema"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gigagrug/schema/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/schema-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/schema-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('9aca104e349532d728e28b6e4adb25eb1b30f2257e5f50dfe89299b39ff48a36')
sha256sums_aarch64=('b09a1b005b7b63f27a896f35f43ead207a90a9bc7d583b9adb8abe3396625732')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/schema"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
