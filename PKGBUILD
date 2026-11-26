# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=shield-bin
pkgver=9.0.2
pkgrel=1
pkgdesc="Backup and restore system for a wide variety of pluggable data systems"
arch=('x86_64')
url="https://github.com/shieldproject/shield"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/shieldproject/shield/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/shield-linux-amd64")
sha256sums=('a4a1544e07cdb692863c26dea5340c837a643b73c1b554a895c64a048bb2e2bd')
sha256sums_x86_64=('fb86087e9b0adc9f8f4813567bd2ad3c558f4288da71805b3cf73ef098f5f87a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/shield"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
