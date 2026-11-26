# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pacaptr-bin
pkgver=0.23.2
pkgrel=1
pkgdesc="Pacman-like syntax wrapper for many package managers"
arch=('x86_64' 'aarch64')
url="https://github.com/rami3l/pacaptr"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pacaptr-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pacaptr-linux-arm64.tar.gz")
sha256sums_x86_64=('1c2f9ee938078486437694bab45b1bb79346e8ea8f6905f343de0ac4d3c94eb2')
sha256sums_aarch64=('0e39e3f7b1f3a3b1d1e8c198f639aeb9ca433e6d08197abb28f8eebe9fe8b67f')

package() {
  install -Dm755 "pacaptr" "${pkgdir}/usr/bin/pacaptr"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
