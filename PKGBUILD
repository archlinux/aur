# Maintainer: NBonaparte <nbonaparte@protonmail.com>

_name='vim-svelte'
pkgname=vim-svelte-git
pkgver=r17.c2a94c8
pkgrel=2
epoch=1
pkgdesc="Vim syntax highlighting and indentation for Svelte 3 components."
arch=('any')
url='https://github.com/evanleck/vim-svelte'
license=('unknown')
depends=('vim' 'vim-javascript')
makedepends=('git')
conflicts=('vim-svelte')
provides=('vim-svelte')
groups=('vim-plugins')
source=("git+https://github.com/evanleck/${_name}.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/"${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/"${_name}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r ftdetect indent syntax "${_installpath}"
}

