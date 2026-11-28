# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=heygen-cli-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Create AI videos from the terminal with HeyGen"
arch=('x86_64' 'aarch64')
url="https://github.com/heygen-com/heygen-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/heygen_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/heygen_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('38b8e74f514dca2633f5c45cc180e42483a6105216d7abbe4cdf3e15a76b1016')
sha256sums_aarch64=('9388d9ea28e1257935ae472a5914e16502145f84c1a70776b223af76bd5e5799')

package() {
  install -Dm755 "heygen" "${pkgdir}/usr/bin/heygen"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
