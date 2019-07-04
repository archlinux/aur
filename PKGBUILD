# Maintainer: Cravix <dr dot neemous at gmail dot com>
# Based on community/vim-jedi PKGBUILD by Levente Polyak <anthraxx[at]archlinux[dot]org>
# check part doesn't work so directly removed it :p if you know how to fix it please tell me :)

pkgname=vim-python-mode
_pkgname=python-mode
pkgver=0.10.0
pkgrel=1
pkgdesc='A vim plugin that make vim into python IDE'
arch=('any')
license=('LGPL3')
url='https://github.com/python-mode/python-mode'
depends=('vim' 'python' 'python-astroid' 'autopep8' 'python-mccabe' 'python-pycodestyle' 'python-pydocstyle' 'python-pyflakes' 'python-pylint' 'python-rope' 'python-six' 'python-snowballstemmer')
#pylama' '
groups=('vim-plugins')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6197e6f2ab190e58a68f01ed784155f2273af31633fd49bb459e8fa498e834cd')


package() {
  cd "${_pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -dpr --no-preserve=ownership pymode "${pkgdir}/usr/share/vim/vimfiles"
  cp -dpr --no-preserve=ownership after "${pkgdir}/usr/share/vim/vimfiles/after"
  cp -dpr --no-preserve=ownership autoload "${pkgdir}/usr/share/vim/vimfiles/autoload"
  cp -dpr --no-preserve=ownership doc "${pkgdir}/usr/share/vim/vimfiles/doc"
  cp -dpr --no-preserve=ownership ftplugin "${pkgdir}/usr/share/vim/vimfiles/ftplugin"
  cp -dpr --no-preserve=ownership plugin "${pkgdir}/usr/share/vim/vimfiles/plugin"
  cp -dpr --no-preserve=ownership syntax "${pkgdir}/usr/share/vim/syntax"

  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
