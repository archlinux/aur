# Maintainer: Radu C. Martin <radu dot c dot martin at gmail dot com>

pkgname=vim-vimtex
_pkgname=vimtex
pkgver=2.16
pkgrel=1
pkgdesc='A modern Vim and neovim filetype plugin for LaTeX files'
arch=('any')
url="https://github.com/lervag/${_pkgname}"
license=('MIT')
depends=('vim')
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2c5aca46e0d27c741595f40814ca0c506bec700bdcfde39c535d9d73bd5c0267')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -dvm755 "${_installpath}"
  cp -rvt "${_installpath}" after autoload compiler doc ftdetect ftplugin indent plugin rplugin syntax
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
