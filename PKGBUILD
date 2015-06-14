# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=vim-misc-xolox-git
_pkgname=xolox-vim-misc
pkgver=6ce98ee
pkgrel=1
pkgdesc='Miscellaneous auto-load Vim scripts'
arch=('any')
url='http://peterodding.com/code/vim/misc'
license=('MIT')
makedepends=(git)
conflicts=(vim-misc-xolox)
provides=(vim-misc-xolox)
_gitroot='git://github.com/xolox/vim-misc.git'
_gitname='vim-misc'
md5sum=('SKIP')

pkgver() {
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g'
  fi
}
package(){
  cd "$srcdir"/$_gitname
  _vim_dir='/usr/share/vim/vimfiles'
  install -dm755 "$pkgdir"$_vim_dir
  cp -r {autoload,doc,plugin} "$pkgdir"/$_vim_dir
}
