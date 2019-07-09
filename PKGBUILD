# Maintainer: xtheosirian <https://aur.archlinux.org/account/xtheosirian>

pkgname=vim-ron-git
pkgver=r4.2ec8a5d
pkgrel=1
pkgdesc="RON syntax highlighting for Vim."
arch=('any')
url='https://github.com/ron-rs/ron.vim'
license=('unknown')
depends=('vim')
makedepends=('git')
conflicts=('vim-ron')
provides=('vim-ron')
groups=('vim-plugins')
source=("git+https://github.com/ron-rs/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r ftdetect ftplugin indent syntax "${_installpath}"
}
