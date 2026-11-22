# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nereid-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Create and explore Mermaid diagrams with AI agents through a terminal UI"
arch=('x86_64' 'aarch64')
url="https://github.com/bnomei/nereid"
license=('LicenseRef-Nereid')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nereid-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nereid-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('781e5ec4b0db2cf40e47efda5410345d0872db3c4a90aaf92a98023bf1b81817')
sha256sums_aarch64=('17b42741ab1953aea3bbb33636ec0f5f69b7835c5edb5b3d5ac25656f114dee5')

package() {
  install -Dm755 "nereid" "${pkgdir}/usr/bin/nereid"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
