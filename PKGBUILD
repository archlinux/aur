# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ncro-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="HTTP proxy that optimizes Nix binary cache routes"
arch=('x86_64' 'aarch64')
url="https://github.com/manic-systems/ncro"
license=('EUPL-1.2')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/manic-systems/ncro/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ncro-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ncro-linux-arm64")
sha256sums=('02895406463d282c1d57a018fc726727ec4e86c2c112b2a512f492fd03ca7f61')
sha256sums_x86_64=('c12d04106e95d7489c139cf32753fa978ff40b902ed498414f8f6185f440797a')
sha256sums_aarch64=('97d477373d1fc57a77e8d9b81c9dcb7c726447fe147f04bc65e9d10f8d1dde01')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ncro"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
