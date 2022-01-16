pkgname=vim-sayonara-git
pkgver=r51.75c73f3
pkgrel=1
pkgdesc="A Vim plugin for sane buffer/window deletion"
arch=("any")
url="https://github.com/mhinz/vim-sayonara"
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
  "git+https://github.com/mhinz/vim-sayonara.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd vim-sayonara
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd vim-sayonara
  install -D -m644 plugin/sayonara.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/sayonara.vim"
  install -D -m644 doc/sayonara.txt "${pkgdir}/usr/share/vim/vimfiles/doc/sayonara.txt"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
