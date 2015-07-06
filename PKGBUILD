# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=vim-syntax-extra-git
pkgver=r10.ge5d52dd
pkgrel=3
pkgdesc="Vim syntax highlighting for C, Bison, Flex (git version)"
arch=('any')
url="https://github.com/justinmk/vim-syntax-extra"
license=('unknown')
makedepends=('git')
source=("${pkgname}::git+https://github.com/justinmk/vim-syntax-extra")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles/"{after/syntax,plugin}
  install -Dm644 after/syntax/*.vim "${pkgdir}/usr/share/vim/vimfiles/after/syntax"
  install -Dm644 plugin/vim-syntax-extra.vim "${pkgdir}/usr/share/vim/vimfiles/plugin"
}

# vim:set ts=2 sw=2 et:
