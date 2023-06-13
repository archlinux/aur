# Maintainer: Radu C. Martin <radu dot c dot martin at gmail dot com>

pkgname=vim-vimtex
_pkgname=vimtex
pkgver=2.13
pkgrel=1
pkgdesc='A modern Vim and neovim filetype plugin for LaTeX files'
arch=('any')
url="https://github.com/lervag/${_pkgname}"
license=('MIT')
depends=('vim')
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('efd80d786a1786ab202022cc006edf79c09c195ace28f22dfe774a3190be6908')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -dvm755 "${_installpath}"
  cp -rvt "${_installpath}" after autoload compiler doc ftdetect ftplugin indent plugin rplugin syntax
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
