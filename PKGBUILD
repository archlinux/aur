# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=devtui-bin
pkgver=0.35.0
pkgrel=1
pkgdesc="Collection of developer tools in one TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/skatkov/devtui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/devtui_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/devtui_Linux_arm64.tar.gz")
sha256sums_x86_64=('99eadcb23838c4c018d793753e8d56536c27e3daafa0a10e94b38d68a94c16af')
sha256sums_aarch64=('0b7f3f300c3f1fd15f50dd73033413c70e2666110fae777b9233b82dc39b31c0')

package() {
  install -Dm755 "devtui" "${pkgdir}/usr/bin/devtui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
