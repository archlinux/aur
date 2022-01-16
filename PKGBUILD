pkgname=vim-taboo-git
pkgver=r46.caf9481
pkgrel=1
pkgdesc="A Vim plugin to manage tabs"
arch=("any")
url="https://github.com/gcmt/taboo.vim"
license=("MIT")

groups=(
  'vim-plugins'
)

makedepends=(
  'git'
)

depends=(
  'vim-runtime'
)

source=(
  "git+https://github.com/gcmt/taboo.vim.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd taboo.vim
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd taboo.vim
  install -D -m644 plugin/taboo.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/taboo.vim"
  install -D -m644 doc/taboo.txt "${pkgdir}/usr/share/vim/vimfiles/doc/taboo.txt"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
