# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=vim-oz
pkgver=1.3.r6.g4a04881
pkgrel=1
pkgdesc='Oz syntax highlighting and formatting for Vim'
arch=('any')
url='https://github.com/Procrat/oz.vim'
license=('unknown')
depends=('vim')
makedepends=('git')

source=("$pkgname"::'git+https://github.com/Procrat/oz.vim.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package(){
  cd "$srcdir/$pkgname"

  _vim_dir="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 ftdetect/oz.vim "${_vim_dir}/ftdetect/oz.vim"
  install -Dm644 ftplugin/oz.vim "${_vim_dir}/ftplugin/oz.vim"
  install -Dm644 syntax/oz.vim "${_vim_dir}/syntax/oz.vim"
}
