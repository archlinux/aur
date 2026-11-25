# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pikpaktui-bin
pkgver=0.0.66
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
sha256sums_x86_64=('fa39cf8f690749e1597b31591690f521a9affad49d80d261049815f095f63b5e')
sha256sums_aarch64=('4d517a6ed2c7fca5fe865c0d17e3f106f3ad5a30a481c94e139c9e00188cf37d')

package() {
  install -Dm755 "pikpaktui" "${pkgdir}/usr/bin/pikpaktui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
