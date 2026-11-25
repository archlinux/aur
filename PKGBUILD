# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=stratus-red-team-bin
pkgver=2.38.2
pkgrel=1
pkgdesc="cloud: :zap: Granular, Actionable Adversary Emulation for the Cloud"
arch=('x86_64' 'aarch64')
url="https://github.com/DataDog/stratus-red-team"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/DataDog/stratus-red-team/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/stratus-red-team_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/stratus-red-team_Linux_arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('2e2448f42dc5ab44aaef602ed2a8d9b7220a82f987d2a06620cf341a192873b4')
sha256sums_aarch64=('20cd30efdbe1e1e6335bbb31dd0e17ba8395e9951693eb91b1fa4d2a8430c252')

package() {
  install -Dm755 "stratus" "${pkgdir}/usr/bin/stratus"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
