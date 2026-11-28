# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=trajan-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="CI/CD pipeline vulnerability detection and attack automation tool"
arch=('x86_64' 'aarch64')
url="https://github.com/praetorian-inc/trajan"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/trajan_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/trajan_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('809c22f6ee43152e88c13bdb81b6082c15c68fc38ab318b2bfc7d9b5944176f6')
sha256sums_aarch64=('e47a6576af5ae80688d1fc956be6f23bd79fe5f3d3f1c8d2db4a79eed798dd6e')

package() {
  install -Dm755 "trajan" "${pkgdir}/usr/bin/trajan"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
