# Maintainer: Thomas Simatic <thomas.sim@mailo.com>
pkgname="i3-scratchpad-git"
pkgver=9
pkgrel=2
pkgdesc="The Swiss Army Knife of floating i3 windows"
arch=(any)
license=('Unlicense')
depends=(i3-wm wmctrl bash)
optdepends=('rxvt-unicode: for terminal programs support')

source=("git+https://gitlab.com/aquator/i3-scratchpad.git")
md5sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}
  git rev-list --all --count
}

package() {
    cd ${pkgname%-git}
    install -Dm 755 i3-scratchpad -t "$pkgdir"/usr/bin
}
