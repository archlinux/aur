# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wire-seek-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Find the best MTU for a WireGuard tunnel"
arch=('x86_64' 'aarch64')
url="https://github.com/yeya/wire-seek"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/yeya/wire-seek/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/wire-seek-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/wire-seek-linux-arm64")
sha256sums=('61e4e517cb4afe23178a2050e0c5b7471b5dd000c93d7afac9ffb9a49479adf6')
sha256sums_x86_64=('92fe0fd295fe09f8f08be11a2cff604f812892de76b044e6f7d36cb95059de9d')
sha256sums_aarch64=('4cd57b8305d6219fbeea01dfa32471c51fd68ce445fa54f2c16431dfa63f8bda')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/wire-seek"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
