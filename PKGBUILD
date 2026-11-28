# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tokenrouter-bin
pkgver=0.8.0
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
sha256sums_x86_64=('10545f8487c47d635731a89caecb64c3059c72a910ca19c9930aabbdd3e796b7')
sha256sums_aarch64=('c400c77cc44f5e21edff93a47d20041cabb0dcb69f0940e7d1c357aa9b8bfb3e')

package() {
  install -Dm755 "tokenrouter" "${pkgdir}/usr/bin/tokenrouter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
