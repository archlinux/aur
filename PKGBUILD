# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=vim-delimitmate
pkgver=2.7
pkgrel=1
pkgdesc='provides insert mode auto-completion for quotes, parens, brackets, etc'
arch=('any')
url='https://github.com/raimondi/delimitmate'
license=('vim-license')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raimondi/delimitMate/archive/${pkgver}.tar.gz")
sha512sums=('46798470586ed1c79abf0368c3542f77412a17c4058e6b9f471fb10e3ad212301db9fb2e2a9ff1ab1dcd53f959f79587d80f1542c479ab291c6cc01314ba5144')

package() {
  cd "${srcdir}/delimitMate-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload}
  install -D -m644 autoload/delimitMate.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/"
  install -D -m644 plugin/delimitMate.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -D -m644 doc/delimitMate.txt "${pkgdir}/usr/share/vim/vimfiles/doc/"
}

# vim:set et sw=2 ts=2 tw=79:
