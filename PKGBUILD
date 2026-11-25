# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=muxy-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Lightweight and Memory efficient terminal multiplexer"
arch=('x86_64' 'aarch64')
url="https://github.com/muxy-app/muxy"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/muxy-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/muxy-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('2dc482c94bb4d7764e2589697502d4f8c8c08275a2b64bfa0418c3599cd8d0d2')
sha256sums_aarch64=('ed9ef5d84469a168d16d8833375a3ff2d79f43080a4293014e1b19caa6175614')

package() {
  install -Dm755 "muxy" "${pkgdir}/usr/bin/muxy"
  install -Dm755 "muxy-server" "${pkgdir}/usr/bin/muxy-server"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
