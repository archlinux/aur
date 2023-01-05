# Maintainer: Radu C. Martin <radu dot c dot martin at gmail dot com>

pkgname=vim-vimtex
_pkgname=vimtex
pkgver=2.12
pkgrel=1
pkgdesc='A modern Vim and neovim filetype plugin for LaTeX files'
arch=('any')
url="https://github.com/lervag/${_pkgname}"
license=('MIT')
depends=('vim')
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f258ad70a8b7549ea0b40081f934c4e9b45bb9b8558ebc1fbe4053918f592b5d')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -dvm755 "${_installpath}"
  cp -rvt "${_installpath}" after autoload compiler doc ftdetect ftplugin indent plugin rplugin syntax
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
