# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=vim-vimtex
_pkgname=vimtex
pkgver=1.5
pkgrel=1
pkgdesc='A modern Vim and neovim filetype plugin for LaTeX files'
arch=('any')
url="https://github.com/lervag/${_pkgname}"
license=('MIT')
depends=()
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f6614c535421f9f0dccabb12b5e2cc19c0ce0358d776da28f6413405b3ac2a9f')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -dvm755 "${_installpath}"
  cp -rvt "${_installpath}" after autoload compiler doc ftplugin indent media plugin rplugin syntax
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
