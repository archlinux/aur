# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazylogcat-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="TUI to view Android logs from adb logcat"
arch=('x86_64' 'aarch64')
url="https://github.com/parfenovvs/lazylogcat"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lazylogcat_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lazylogcat_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('244b6be399828777ac40c64a02a8ebd792bb5144e8817e5c4dad5557e7ef24cd')
sha256sums_aarch64=('b1cee2397462c21e391a12524bb02223db39f8836812004f9f1283b517272c67')

package() {
  install -Dm755 "lazylogcat" "${pkgdir}/usr/bin/lazylogcat"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
