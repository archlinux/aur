# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=transok-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="LAN file sharing tool"
arch=('x86_64' 'aarch64')
url="https://github.com/bent2685/transok"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/bent2685/transok/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/transok-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/transok-${pkgver}-linux-arm64.tar.gz")
sha256sums=('c949e6a57a197bf801525c2d61482e991311868c564b936a7e444f88e6510c34')
sha256sums_x86_64=('2471cee92303329fd4934ec9d647de3d55bf445fbcea88b248d835ac9bd51204')
sha256sums_aarch64=('6237c4916e52e97b7620083301994a86933c32276f5e739984e0e3d0022f2d95')

package() {
  install -Dm755 "transok" "${pkgdir}/usr/bin/transok"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
