# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sharkord-bin
pkgver=0.0.33
pkgrel=1
pkgdesc="Lightweight self-hosted chat server with voice, video, text and screen sharing"
arch=('x86_64' 'aarch64')
url="https://github.com/Sharkord/sharkord"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Sharkord/sharkord/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/sharkord-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/sharkord-linux-arm64")
sha256sums=('2e6d0651742cf8c9bde6aa7713e06f82db92143732c7a5b430f5a5ccbd6891f9')
sha256sums_x86_64=('858ec4173babc99fe9bc669c9812f3aafd66936a1d95d6791b5f61ef03f2e7b2')
sha256sums_aarch64=('fc58fd4128d58adca6160e14051bbc697d8c104138e454c64fdc26ccc7d0369d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sharkord"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
