# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pgroll-bin
pkgver=0.16.3
pkgrel=1
pkgdesc="PostgreSQL zero-downtime migrations made easy"
arch=('x86_64' 'aarch64')
url="https://github.com/xataio/pgroll"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/xataio/pgroll/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/pgroll.linux.amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/pgroll.linux.arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('e86ccd704f7d99a0794a75a6c1d1095d30c8bc8c21a22b793914db8340bad182')
sha256sums_aarch64=('c37f41f29b8e5784a47f91069975bd397448cf1014d47cd426680f18a84804a7')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pgroll"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
