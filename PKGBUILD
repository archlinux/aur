# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gophenberg-bin
pkgver=0.20.1
pkgrel=1
pkgdesc="Plugin-first CMS with a Gutenberg editor"
arch=('x86_64' 'aarch64')
url="https://github.com/gopherium/gophenberg"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gophenberg_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gophenberg_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4f9a66caf398e1ede4630a23114176802e28d52a1479d2c32246dd75fbb16af6')
sha256sums_aarch64=('f7651efe87ebb6e567649ac3f24d9246f7700a502138c29eae286c9c58ed1540')

package() {
  install -Dm755 "gophenberg" "${pkgdir}/usr/bin/gophenberg"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
