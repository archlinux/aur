# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=turnable-bin
pkgver=0.8.7
pkgrel=1
pkgdesc="VPN core for tunneling through TURN or SFU servers"
arch=('x86_64' 'aarch64')
url="https://github.com/TheAirBlow/Turnable"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/TheAirBlow/Turnable/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/turnable-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/turnable-linux-arm64")
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_x86_64=('31df53cdfbd00b58f12619ea42b372009d4a55b464556eb24a5393ee606d7d91')
sha256sums_aarch64=('e81f88b7f31660bb907c5e5d5c3d388870b6c0b5767a6ab1271b5a61dadb950f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/turnable"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
