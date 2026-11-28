# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=check-projects-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Check the git status of many projects organized by category"
arch=('x86_64' 'aarch64')
url="https://github.com/uralys/check-projects"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/check-projects_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/check-projects_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('b0b395d956478c78a68ca35a5f25470e2ccef9b3e4fd7fb7d8bbfeed6a6d2b60')
sha256sums_aarch64=('6680bd8c83b28c0a8d13e22b3fec7c7ef0ae281ceb549201752d4d63db21c4de')

package() {
  install -Dm755 "check-projects" "${pkgdir}/usr/bin/check-projects"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
