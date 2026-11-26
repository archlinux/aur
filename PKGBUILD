# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=csprecon-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Discover target domains using Content Security Policy headers"
arch=('x86_64' 'aarch64')
url="https://github.com/edoardottt/csprecon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/csprecon_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/csprecon_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('ba5553165e20b3a615e9b86b56c4fbae76b1ec985c5bf01478e7235f9682a03f')
sha256sums_aarch64=('d89e0383954be53bc72a36291abffe981d625fcda5539c263d391d4b2892835f')

package() {
  install -Dm755 "csprecon" "${pkgdir}/usr/bin/csprecon"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
