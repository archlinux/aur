# Maintainer: xtheosirian <https://aur.archlinux.org/account/xtheosirian>

pkgname=vim-gluon-git
pkgver=r16.07f9f69
pkgrel=1
pkgdesc="Vim plugin for syntax highlighting and indentation for Gluon."
arch=('any')
url='https://github.com/salpalvv/vim-gluon'
license=('MIT')
depends=('vim')
makedepends=('git')
conflicts=('vim-gluon')
provides=('vim-gluon')
groups=('vim-plugins')
source=("git+https://github.com/salpalvv/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r ftdetect indent syntax "${_installpath}"
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
