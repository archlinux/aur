# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=evener-bin
pkgver=0.3.34
pkgrel=1
pkgdesc="Coding agent with native tool-calling for OpenAI, Anthropic and Google models"
arch=('x86_64')
url="https://github.com/prime-radiant-inc/evener"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/evener_linux_amd64.tar.gz")
sha256sums_x86_64=('d50314e86c8688977e1efb0eb295f8274ad7316ca219dff09d0909b7dfc19d3f')

package() {
  install -Dm755 "evener_linux_amd64/evener" "${pkgdir}/usr/bin/evener"
  install -Dm644 "evener_linux_amd64/LICENSE-kilroy" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "evener_linux_amd64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
