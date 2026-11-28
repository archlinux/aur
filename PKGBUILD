# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=world-chain-bin
pkgver=2.8.3
pkgrel=1
pkgdesc="World Chain node"
arch=('x86_64' 'aarch64')
url="https://github.com/worldcoin/world-chain"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/worldcoin/world-chain/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/world-chain-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/world-chain-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('fbf3577ff7d1afe1553ef48fe3714bdc17dcae9433cf2bda20242453ba6dd688')
sha256sums_x86_64=('531212593f386e64d5414c9768dd1821174695ba35a9fb2bc543a280c323ff3c')
sha256sums_aarch64=('067aaec1a16b73e9be2bae718c37f87b2a672d97bef3b27f9eb28fdd37a0916e')

package() {
  install -Dm755 "world-chain" "${pkgdir}/usr/bin/world-chain"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
