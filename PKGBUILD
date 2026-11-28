# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rtty-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal in the browser over WebSocket"
arch=('x86_64' 'aarch64')
url="https://github.com/skanehira/rtty"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rtty_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rtty_Linux_arm64.tar.gz")
sha256sums_x86_64=('e44128f93e3a92f0c043cf892e3342623e6be820cfd8cf248a716a4efde1dc8e')
sha256sums_aarch64=('556f68c6c60eb71dabcd409eed6c70d52ad195471b051ea5f57bf8aab093a0e7')

package() {
  install -Dm755 "rtty" "${pkgdir}/usr/bin/rtty"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
