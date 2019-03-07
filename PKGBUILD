# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=weechat-vimode
pkgver=r173.1da5a2e
pkgrel=1
pkgdesc='A WeeChat script that adds vi-like modes, commands and keybindings'
url='https://github.com/GermainZ/weechat-vimode'
arch=('any')
license=('GPL3')
depends=('weechat')
makedepends=('git')
source=('git+https://github.com/GermainZ/weechat-vimode.git')
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -Dm644 "vimode.py" "${pkgdir}/usr/lib/weechat/python/vimode.py"
}
