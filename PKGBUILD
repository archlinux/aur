# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dendy-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="NES/Famicom emulator with P2P network multiplayer"
arch=('x86_64')
url="https://github.com/maxpoletaev/dendy"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/maxpoletaev/dendy/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/dendy-linux-amd64")
sha256sums=('2a1913fab5a013d216064bc216cab36a42e6df1bd5d1b2b9c4df1c3171e48c44')
sha256sums_x86_64=('7d3913b1d078ab87538ccf40ece9d5c7d544dc3e3cfa2b49c2312b5549dc1eb9')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dendy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
