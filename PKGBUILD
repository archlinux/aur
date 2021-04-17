# Maintainer: lmartinez-mirror
pkgbase=vim-palenight-git
pkgname=('vim-palenight-git' 'vim-airline-palenight-git' 'vim-lightline-palenight-git')
pkgver=r19.847fcf5
pkgrel=1
pkgdesc="A dark colorscheme for Vim/Neovim based on Material Pale Night and onedark.vim"
arch=('any')
url="https://github.com/drewtempelmeyer/palenight.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgbase::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-palenight-git() {
  optdepends=('vim-airline-palenight: Airline colorscheme'
              'vim-lightline-palenight: Lightline colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/palenight.vim "$pkgdir/usr/share/vim/vimfiles/autoload/palenight.vim"
  install -Dvm 644 colors/palenight.vim "$pkgdir/usr/share/vim/vimfiles/colors/palenight.vim"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

package_vim-airline-palenight-git() {
  depends=('vim-airline')
  optdepends=('vim-palenight: Base vim colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/airline/themes/palenight.vim "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/palenight.vim"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_vim-lightline-palenight-git() {
  depends=('vim-lightline')
  optdepends=('vim-palenight: Base vim colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/lightline/colorscheme/palenight.vim "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/palenight.vim"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
