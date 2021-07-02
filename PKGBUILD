# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=weechat-vimode-git
pkgver=r173.1da5a2e
pkgrel=2
pkgdesc='A WeeChat script that adds vi-like modes, commands and keybindings'
url='https://github.com/GermainZ/weechat-vimode'
arch=('any')
license=('GPL3')
depends=('weechat')
makedepends=('git')
source=('git+https://github.com/GermainZ/weechat-vimode.git')
sha512sums=('SKIP')

_gitname='weechat-vimode'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"
  install -Dm644 "vimode.py" "${pkgdir}/usr/share/weechat/python/vimode.py"
}
