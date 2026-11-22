# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=revw-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="A vim-like TUI for managing notes"
arch=('x86_64' 'aarch64')
url="https://github.com/rlelf/revw"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rlelf/revw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/revw-linux-x86_64-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/revw-linux-aarch64-musl.tar.gz")
sha256sums=('1cbb5502dd3eefe9e65f5ad5cc2c264f8ae50647eebc80a0504adc12b8ac161c')
sha256sums_x86_64=('fdaedc9068fba081d55f3d06f3a647409e35d161291ba072967b65a006f17188')
sha256sums_aarch64=('1e8bb8f377b71868e54d09ed37fba66e07c430e42d186c661f0ffcb532e51216')

package() {
  install -Dm755 "revw" "${pkgdir}/usr/bin/revw"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
