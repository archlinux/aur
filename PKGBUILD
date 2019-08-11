# Maintainer: xtheosirian <https://aur.archlinux.org/account/xtheosirian>

_pkgname=vim-dyon
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
source=("git+https://github.com/thyrgle/vim-dyon.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 ftdetect/dyon.vim "${_installpath}"/ftdetect/dyon.vim
  install -D -m644 ftplugin/dyon.vim "${_installpath}"/ftplugin/dyon.vim
  install -D -m644 indent/dyon.vim "${_installpath}"/indent/dyon.vim
  install -D -m644 syntax/dyon.vim "${_installpath}"/syntax/dyon.vim
}
