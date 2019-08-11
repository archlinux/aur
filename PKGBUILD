# Maintainer: xtheosirian <https://aur.archlinux.org/account/xtheosirian>

_pkgname=ron.vim
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
source=("git+https://github.com/ron-rs/ron.vim.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 ftdetect/ron.vim "${_installpath}"/ftdetect/ron.vim
  install -D -m644 ftplugin/ron.vim "${_installpath}"/ftplugin/ron.vim
  install -D -m644 indent/ron.vim "${_installpath}"/indent/ron.vim
  install -D -m644 syntax/ron.vim "${_installpath}"/syntax/ron.vim
}
