# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=git-alerts-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Monitor GitHub org users' public repositories for secrets"
arch=('x86_64' 'aarch64')
url="https://github.com/boringtools/git-alerts"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/git-alerts_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/git-alerts_Linux_arm64.tar.gz")
sha256sums_x86_64=('4832a9f1777cb6c9f7bd456419f4442e8ed82c7f193611084013d5c31a229ba1')
sha256sums_aarch64=('10997a8638e409bc4a3d404b2601ecc986130def2fb2e6f183039a83a0135ced')

package() {
  install -Dm755 "git-alerts" "${pkgdir}/usr/bin/git-alerts"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
