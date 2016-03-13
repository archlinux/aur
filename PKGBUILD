# Maintainer: Leif Warner <abimelech@gmail.com>
_gitname=ghcmod-vim
pkgname=vim-ghcmod-git
pkgver=v1.3.1.r19.815616e
pkgrel=1
pkgdesc="ghc-mod powered editing in vim"
arch=('any')
url="https://github.com/eagletmt/ghcmod-vim"
license=('BSD3')
depends=('vim-vimproc' 'ghc-mod')
makedepends=('git')
provides=(vim-ghcmod)
conflicts=(vim-ghcmod)
source=("git://github.com/eagletmt/ghcmod-vim.git")
md5sums=('SKIP')
install=vimdoc.install

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$srcdir/$_gitname"
  for f in after/ftplugin/haskell/ghcmod.vim autoload/ghcmod.vim autoload/ghcmod/* doc/* plugin/* ; do
    install -Dm644 $f "${pkgdir}/usr/share/vim/vimfiles/$f"
  done
}

# vim:set ts=2 sw=2 et:
