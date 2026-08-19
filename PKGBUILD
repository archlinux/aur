# Maintainer: Miguel Scaramozzino <mikele@gmail.com>

pkgname=leenky-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Leenky, a desktop clipboard URL collector for Linux"
arch=('x86_64')
url="https://github.com/mikelexp/Leenky"
license=('custom')
depends=(
  'glibc'
  'libxcb'
  'libxkbcommon-x11'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
)
source=("${url}/releases/download/v${pkgver}/leenky-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('e494bd8def4d9d2d6b66e7fe2ecd33a3e548548ad5cb7ec7e1b414d5b3005ff3')

package() {
  cd "${srcdir}"

  install -Dm755 leenky "${pkgdir}/usr/bin/leenky"
  install -Dm644 leenky.desktop "${pkgdir}/usr/share/applications/leenky.desktop"
  install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/leenky.png"
}
