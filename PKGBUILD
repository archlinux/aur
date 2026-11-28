# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=autospec-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="CLI for spec-driven development"
arch=('x86_64' 'aarch64')
url="https://github.com/ariel-frischer/autospec"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/autospec_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/autospec_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('d67db241e92e544c8c53ea5a3d38135908e7a801e22b7c87201ecb1add7ac24b')
sha256sums_aarch64=('8a9a636bc051a904d2f30d7e6290da0221a393eaf884805f2d4a95d3557025a6')

package() {
  install -Dm755 "autospec" "${pkgdir}/usr/bin/autospec"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
