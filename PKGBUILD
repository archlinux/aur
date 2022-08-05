pkgname=vim-oscyank-git
pkgver=r64.360ccdc
pkgrel=1
pkgdesc="A Vim plugin copy text to system clipboard"
arch=("any")
url="https://github.com/ojroques/vim-oscyank"
license=("BSD")

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
  "git+https://github.com/ojroques/vim-oscyank.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd vim-oscyank
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd vim-oscyank
  install -D -m644 plugin/oscyank.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/oscyank.vim"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
