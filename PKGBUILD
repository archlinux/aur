# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=vim-vimtex
_pkgname=vimtex
pkgver=2.1
pkgrel=1
pkgdesc='A modern Vim and neovim filetype plugin for LaTeX files'
arch=('any')
url="https://github.com/lervag/${_pkgname}"
license=('MIT')
depends=('vim')
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d8f65c187bc308cfc226f17de5b2cfc5c32af1a759b3bdb7cde469b727cc8c64')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -dvm755 "${_installpath}"
  cp -rvt "${_installpath}" after autoload compiler doc ftdetect ftplugin indent media rplugin syntax
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
