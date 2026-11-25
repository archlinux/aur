# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sine-bin
pkgver=2.3.3
pkgrel=1
pkgdesc="Theme manager for Firefox-based browsers"
arch=('x86_64' 'aarch64')
url="https://github.com/CosmoCreeper/Sine"
license=('MPL-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/CosmoCreeper/Sine/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/sine-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/sine-linux-arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('b4d3af1eaf744adbfdbd7e0cc931fd73ce7a21a21a8f6874b6fd4f533ccd6d5b')
sha256sums_aarch64=('ece9b771d0d7c7dacc3830559847a4a95fd60aabe1032a8dc2ec2557757a1211')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sine"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
