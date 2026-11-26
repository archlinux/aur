# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=emcee-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Generate MCP servers from OpenAPI specs"
arch=('x86_64' 'aarch64')
url="https://github.com/mattt/emcee"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/emcee_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/emcee_Linux_arm64.tar.gz")
sha256sums_x86_64=('053db42913356c00cd62c636c67dd3cd0dbb2d9e3a0eca2b102c4f25c93fbcdd')
sha256sums_aarch64=('dd9dff396fbf19c20d13aae1ac8fb9ac074803e2502ee656a082160eee0fcd29')

package() {
  install -Dm755 "emcee" "${pkgdir}/usr/bin/emcee"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
