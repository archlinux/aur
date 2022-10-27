# Maintainer: Chinmay Dalal <00foahcd7@mozmail.com>

pkgname=wezterm-terminfo-git
pkgver=r6423.g43f2265ef
pkgrel=1
pkgdesc="Terminfo for wezterm"
arch=(x86_64)
url="https://wezfurlong.org/wezterm"
license=(MIT)
depends=()
makedepends=(ncurses)
source=("git+https://github.com/wez/wezterm.git")
sha256sums=('SKIP')

pkgver() {
  printf "r%s.g%s" "$(git -C "${pkgname%-terminfo-git}" rev-list --count HEAD)" "$(git -C "${pkgname%-terminfo-git}" rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/share/terminfo"
  tic -x -o "$pkgdir/usr/share/terminfo" "${pkgname%-terminfo-git}/termwiz/data/wezterm.terminfo"
}
