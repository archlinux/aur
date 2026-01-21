pkgname=just-talk-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Speech recognition app with global hotkey support"
arch=('x86_64')
url="https://github.com/whoamihappyhacking/just-talk"
license=('GPL-3.0-or-later')
options=('!debug')
optdepends=(
  'xdotool: X11 auto-submit typing'
  'wtype: Wayland auto-submit typing'
)
provides=('just-talk')
conflicts=('just-talk' 'just-talk-git')
_pkgfile="just-talk-linux-x86_64-v${pkgver}.tar.zst"
source=("${_pkgfile}::https://github.com/whoamihappyhacking/just-talk/releases/download/v${pkgver}/${_pkgfile}")
sha256sums=('4f4bb5a965d006d1e65563680fff6c0784aa272cb7fe75a24c281f1f1a1fe440')

package() {
  install -Dm755 "$srcdir/just-talk" "$pkgdir/usr/bin/just-talk"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/just-talk.png"
  install -Dm644 "$srcdir/just-talk.desktop" "$pkgdir/usr/share/applications/just-talk.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
