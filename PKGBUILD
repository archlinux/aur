# Maintainer: sQVe <oskargrunning@gmail.com>

arch=('any')
depends=('weechat')
license=('GPL3')
sha512sums=('SKIP')
pkgdesc='A WeeChat script that adds vi-like modes, commands and keybindings'
pkgname=weechat-vimode
pkgrel=1
pkgver=r173.1da5a2e
source=('git+https://github.com/GermainZ/weechat-vimode.git')
makedepends=('git')
url='https://github.com/GermainZ/weechat-vimode'

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"

  install -Dm644 "vimode.py" "${pkgdir}/usr/lib/weechat/python/vimode.py"
}
