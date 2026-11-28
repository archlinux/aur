# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=opensoho-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Manage a small number of OpenWrt devices"
arch=('x86_64' 'aarch64')
url="https://github.com/rubenbe/opensoho"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/opensoho_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/opensoho_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('85c5b9b15fd55857b8e8f3cce237a43047e3fa953cd59bb8a487e210d651d4d2')
sha256sums_aarch64=('c446c9bc378593ce5196cf3eeb2a9aa0dba7f05880ac747295e91fa526265f68')

package() {
  install -Dm755 "opensoho" "${pkgdir}/usr/bin/opensoho"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
