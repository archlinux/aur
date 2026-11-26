# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=prometheus-msteams-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="Forward Prometheus Alertmanager notifications to Microsoft Teams"
arch=('x86_64')
url="https://github.com/prometheus-msteams/prometheus-msteams"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/prometheus-msteams/prometheus-msteams/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/prometheus-msteams-linux-amd64")
sha256sums=('e9f7f163a46e38d63d4e100ae0e2d3c959fb039b92a0a21eae55161a788b93fb')
sha256sums_x86_64=('0631477221a9a207641bce1699d6cc974e683feba89ad14f16457f850314932f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/prometheus-msteams"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
