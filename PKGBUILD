# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chief-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Break big projects into tasks and build them with Claude"
arch=('x86_64' 'aarch64')
url="https://github.com/minicodemonkey/chief"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chief_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/chief_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cf0b4b5b4cbd3b27de065bd32489938f46f40ad16ff08b8e354274986255f3dc')
sha256sums_aarch64=('b0ea988385a3186e6c44cf96a35d3605899fc536551e173a74a36f5c36198e2c')

package() {
  install -Dm755 "chief" "${pkgdir}/usr/bin/chief"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
