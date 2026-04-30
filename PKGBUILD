# Maintainer: goosie

pkgname=proton-pass-rofi-git
_pkgname=proton-pass-rofi
pkgver=r3.gb7737d7
pkgrel=1
pkgdesc='rofi frontend for the Proton Pass CLI'
arch=('any')
url='https://github.com/volysandro/proton-pass-rofi'
license=('custom')
depends=('python' 'rofi')
makedepends=('git')
optdepends=(
  'pass-cli: required Proton Pass CLI backend; install with Proton upstream installer'
  'wl-clipboard: clipboard support on Wayland'
  'xclip: clipboard support on X11'
  'xsel: alternate clipboard support on X11'
  'wtype: typing support on Wayland'
  'xdotool: typing support on X11'
  'libnotify: desktop notifications via notify-send'
  'rofi-sensible-terminal: default terminal command for login/logout'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
