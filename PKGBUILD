# Maintainer: Emanuel Couto <unit73e@gmail.com>
_gitname=neco-ghc
pkgname=vim-neco-ghc-git
pkgver=r140.7f02a9c
pkgrel=1
pkgdesc="A completion plugin for Haskell, using ghc-mod"
arch=('any')
url="https://github.com/eagletmt/neco-ghc"
license=('BSD3')
depends=('ghc-mod')
makedepends=('git')
provides=(vim-neco-ghc)
conflicts=(vim-neco-ghc)
source=("git://github.com/eagletmt/neco-ghc.git")
md5sums=('SKIP')
install=vimdoc.install

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  for f in rplugin/python3/deoplete/sources/ghc.py autoload/necoghc.vim autoload/necoghc/* autoload/neocomplcache/sources/ghc.vim autoload/neocomplete/sources/ghc.vim plugin/* ; do
    install -Dm644 $f "${pkgdir}/usr/share/vim/vimfiles/$f"
  done
}

