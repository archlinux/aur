# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=showagent-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Find local coding agent sessions and switch agents mid-task without losing the conversation"
arch=('x86_64' 'aarch64')
url="https://github.com/aytzey/showagent"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/showagent_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/showagent_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('adaa828be04411bef9dc0a438f61daab4460b1d781754febbd5d48b8539e7177')
sha256sums_aarch64=('042c6c9d59081b3847853a5af419a7f0171856bb1f4dc1b94cd5b6edb73701e2')

package() {
  install -Dm755 "showagent" "${pkgdir}/usr/bin/showagent"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
