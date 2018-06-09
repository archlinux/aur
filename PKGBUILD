# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=vim-dein
pkgver=1.5
pkgrel=1
pkgdesc="dark powered Vim/Neovim plugin manager"
arch=('any')
url="https://github.com/Shougo/dein.vim"
license=('MIT')
depends=()
optdepends=(
  'neovim: use in nvim'
  'vim: use in vim'
)
makedepends=('git')
install=vim-dein.install
source=("https://github.com/Shougo/dein.vim/archive/${pkgver}.tar.gz")
sha512sums=('5640c1867cc8b9516ee409991971cf029ddf355a4d9a11ccf2cd58ccaae81a0a2e52a69a2c7444bd794c6e9af8e7447bbb621c7605cda3e152e153381f15f461')

package() {
  cd "dein.vim-${pkgver}"
  sharepath="${pkgdir}/usr/share"
  vimpath="${sharepath}/vim/vimfiles"
  # install to global Vim directory
  install -Dm 644 doc/dein.txt "${vimpath}/doc/dein.txt"
  cp -R autoload ${vimpath}
  # LICENSE and README
  install -Dm 644 LICENSE ${sharepath}/licenses/${pkgname}/LICENSE
  install -Dm 644 README.md ${sharepath}/doc/${pkgname}/README
}
