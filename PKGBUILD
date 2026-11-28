# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=compose-generator-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Generate Docker Compose configurations"
arch=('x86_64' 'aarch64')
url="https://github.com/compose-generator/compose-generator"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/compose-generator_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/compose-generator_linux_arm64.tar.gz")
sha256sums_x86_64=('e2302f607136c68e4f36a433f489df7a1bb6935009be268c6085defaad4de4b3')
sha256sums_aarch64=('43eb083090526d78d424b3f60affe825b2235dd020450b9d571b4d6f4862c11d')

package() {
  install -Dm755 "compose-generator" "${pkgdir}/usr/bin/compose-generator"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "predefined-services/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
