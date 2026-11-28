# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=filebin2-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Web application for convenient file sharing"
arch=('x86_64' 'aarch64')
url="https://github.com/espebra/filebin2"
license=('BSD-3-Clause')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/espebra/filebin2/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/filebin2-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/filebin2-linux-arm64")
sha256sums=('929813693817a606e9da16f2b7f62ae67e9f98687cbcf5f425143f29b004e9d4')
sha256sums_x86_64=('b00ac827d2602e7e9fda702be7cbd1a12d2d09313929c0adf6278d7cb74c549e')
sha256sums_aarch64=('10d355b36cfa531e6a6c44bfc51c0b29b2c30ade6d996c9861f9d5c994f5443a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/filebin2"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
