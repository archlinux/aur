# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pikpaktui-bin
pkgver=0.0.65
pkgrel=1
pkgdesc="TUI and CLI client for PikPak cloud storage"
arch=('x86_64' 'aarch64')
url="https://github.com/bengerthelorf/pikpaktui"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/bengerthelorf/pikpaktui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pikpaktui-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pikpaktui-aarch64-linux.tar.gz")
sha256sums=('9e388e61362a57c3ae5bc5661089f23ed9ed898fcb3ccf351a4b7fbab64b12d3')
sha256sums_x86_64=('6712f59baad684074dcbf67b60f70f15687f4922b1b585e20238b5c8a3665e8c')
sha256sums_aarch64=('9f801610e436c9e9716953fd3d881d956eb728e0a60fdf1dae24119e1c1bbfac')

package() {
  install -Dm755 "pikpaktui" "${pkgdir}/usr/bin/pikpaktui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
