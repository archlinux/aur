# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tokenrouter-bin
pkgver=0.7.6
pkgrel=1
pkgdesc="tokenrouter is the next generation llm gateway"
arch=('x86_64' 'aarch64')
url="https://github.com/TokenFlux/TokenRouter"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tokenrouter_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tokenrouter_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f47875f8be5a62e37fd7ec1d4b208c2d298617ae719d813f9e95e6374c6aede5')
sha256sums_aarch64=('3af4e0dc739c2cecb4fe15ba0b2846007160c6ce569faabf2f4b8bab223a584a')

package() {
  install -Dm755 "tokenrouter" "${pkgdir}/usr/bin/tokenrouter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
