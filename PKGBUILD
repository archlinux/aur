# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=argo9s-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="K9s-inspired terminal UI for monitoring Argo CD resources"
arch=('x86_64' 'aarch64')
url="https://github.com/vvrnv/argo9s"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/argo9s_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/argo9s_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('560bc0e4bb8f26c5dc8f9b8d95a3323b398f0340ae5d01c5bed400abd9712e7d')
sha256sums_aarch64=('fc6af9ddf588c9b2093cd4e35be5c786cf657035e0b51efc959bc208d63dfc89')

package() {
  install -Dm755 "argo9s" "${pkgdir}/usr/bin/argo9s"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
