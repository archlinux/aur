# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=labctl-bin
pkgver=0.1.116
pkgrel=1
pkgdesc="Start remote iximiuz Labs microVM playgrounds from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/iximiuz/labctl"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/labctl_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/labctl_linux_arm64.tar.gz")
sha256sums_x86_64=('a06c3b443a0c61f215d3382504047cd12b22e612b56490eb8e9fd65bb2adb53a')
sha256sums_aarch64=('a3c4c81061b9beedefedc24839e542f2b578e1e4faa482baa990c976b6b24fce')

package() {
  install -Dm755 "labctl" "${pkgdir}/usr/bin/labctl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
