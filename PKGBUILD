# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vuls-bin
pkgver=0.43.0
pkgrel=1
pkgdesc="Agent-less vulnerability scanner for Linux, FreeBSD, Container, WordPress, Programming language libraries, Network devices"
arch=('x86_64' 'aarch64')
url="https://github.com/future-architect/vuls"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/vuls_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/vuls_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4160fd5d09afc33bba37e728b26e3e2f9c2a612d5f1c1195eacfa3e495aad937')
sha256sums_aarch64=('f83a735b4e91a1d98a5c6b638f75d6b180681b0d3c3593c47828f1fbd9292b73')

package() {
  install -Dm755 "vuls" "${pkgdir}/usr/bin/vuls"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
