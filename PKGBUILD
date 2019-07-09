# Maintainer: xtheosirian <https://aur.archlinux.org/account/xtheosirian>

pkgname=vim-dyon-git
pkgver=r13.f171ea7
pkgrel=1
pkgdesc="Vim syntax highlighting for Dyon language."
arch=('any')
url='https://github.com/thyrgle/vim-dyon'
license=('unknown')
depends=('vim')
makedepends=('git')
conflicts=('vim-dyon')
provides=('vim-dyon')
groups=('vim-plugins')
source=("git+https://github.com/thyrgle/${pkgname%-git}.git")
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
