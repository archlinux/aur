# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wptui-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Keyboard-driven WhatsApp client for the terminal"
arch=('x86_64')
url="https://github.com/andiveli/wptui"
license=('MIT')
depends=('alsa-lib' 'chafa' 'glibc' 'libgcc' 'wayland')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wptui-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8ebfc82765f7b36d4dca4d36a27fba2510d6f1bb1bc05d91ff3a4c8bf10a94fe')

package() {
  install -Dm755 "wp-tui" "${pkgdir}/usr/bin/wp-tui"
  install -Dm644 "assets/sounds/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
