# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pikpaktui-bin
pkgver=0.0.68
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
sha256sums_x86_64=('3473fcacddac225e07921c18cea93d27e2c0ac3636b283c0734cb15fac5a9d06')
sha256sums_aarch64=('8c5b483789357187c73caa323ff7539c3c38f64c9a1b4396ccefe5bf0ad646a9')

package() {
  install -Dm755 "pikpaktui" "${pkgdir}/usr/bin/pikpaktui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
