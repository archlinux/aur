# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=loopers-oss-bin
pkgver=2.25.2
pkgrel=1
pkgdesc="Firewall for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/try-loopers/loopers-oss"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/loopers_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/loopers_Linux_arm64.tar.gz")
sha256sums_x86_64=('19e4d949df84fb5d22c35ceb10fcd6079927535d2a92cb0ccb1d3de4e4fa47a9')
sha256sums_aarch64=('3a1b2c115ba93bac86062e3ad477b4855db9eaef25b09034063f30d8964581c6')

package() {
  install -Dm755 "loopers" "${pkgdir}/usr/bin/loopers"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
