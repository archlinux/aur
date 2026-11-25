# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=helm-dashboard-bin
pkgver=2.1.4
pkgrel=1
pkgdesc="The missing UI for Helm - visualize your releases"
arch=('x86_64' 'aarch64')
url="https://github.com/komodorio/helm-dashboard"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/helm-dashboard_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/helm-dashboard_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('f501875282d419a3bb09415b6d059d1c86b89936ad1feb8c30dfd27f6c82e05d')
sha256sums_aarch64=('2421bdf8754db3033a825ca268c30c1b9276a12b3648b2668da5b0a23dc4cf66')

package() {
  install -Dm755 "helm-dashboard" "${pkgdir}/usr/bin/helm-dashboard"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
