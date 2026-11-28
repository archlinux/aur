# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gameap-bin
pkgver=4.5.9
pkgrel=1
pkgdesc="Game server management panel"
arch=('x86_64' 'aarch64')
url="https://github.com/gameap/gameap"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gameap/gameap/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gameap-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gameap-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('97fabb1339d5d2ce08fe77cdc0bd86b606d831073a003aee8cfab0230a472927')
sha256sums_x86_64=('2eeed9d5437fcb27eaee24fc1f5d52b7e4de3d6bdf04bb155f4c1411255f7e6b')
sha256sums_aarch64=('bc29bd62aef3fc7b1ffec99c1281a1c8ff42707a84d6e2a1085e59174506f1ab')

package() {
  install -Dm755 "gameap" "${pkgdir}/usr/bin/gameap"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
