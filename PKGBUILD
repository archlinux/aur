# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=vim-vital
_gitcommit=982e0bf3a5c181c0fa9d37bab784412f941f6b80
pkgver=3113.982e0bf3
pkgrel=2
epoch=1
pkgdesc='Comprehensive Vim utility functions for Vim plugins'
url='https://github.com/vim-jp/vital.vim'
arch=('any')
license=('custom:NYSL')
depends=('vim' 'git')
groups=('vim-plugins')
source=(${pkgname}::"git+https://github.com/vim-jp/vital.vim#commit=${_gitcommit}")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp -r -t "${_installpath}" autoload doc plugin
  install -Dm 644 README.md Changes -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 README.md -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
