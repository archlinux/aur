# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-markdown2confluence-bin
pkgver=3.4.6
pkgrel=1
pkgdesc="Push Markdown files to Confluence Cloud"
arch=('x86_64' 'aarch64')
url="https://github.com/justmiles/go-markdown2confluence"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-markdown2confluence_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-markdown2confluence_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f6e61b32e379a6765e13adc27b717de65574b6b006a7593a04c0d6488d11ee82')
sha256sums_aarch64=('f0e77b2c7fb8ae88166e3a8036f93dd34d71e644932caac2c7372630597bdab3')

package() {
  install -Dm755 "markdown2confluence" "${pkgdir}/usr/bin/markdown2confluence"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
