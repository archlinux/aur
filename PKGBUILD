# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herdr-sidebar-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="File explorer and git sidebar pane for herdr"
arch=('x86_64' 'aarch64')
url="https://github.com/alexarthurs/herdr-sidebar"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/alexarthurs/herdr-sidebar/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/herdr-sidebar-x86_64-unknown-linux-musl")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/herdr-sidebar-aarch64-unknown-linux-musl")
sha256sums=('e379659655b186af37842bf1df3e6c0e29a02a62f6cbf388a9607c440da9aea7')
sha256sums_x86_64=('572f9e651930f8365b22332499648f2e4bfb09115235ae5610f0b259af529744')
sha256sums_aarch64=('33722871d0ec22d5c85d653d3a9166e74f34309cc7ee6a94da4dd59b8db5b429')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr-sidebar"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
