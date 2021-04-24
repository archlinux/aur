# Maintainer: lmartinez-mirror
pkgbase=vim-embark-git
pkgname=('vim-embark-git' 'vim-airline-embark-git' 'vim-lightline-embark-git')
pkgver=r58.fda8867
pkgrel=3
pkgdesc="A deep inky purple theme leveraging bright colors"
arch=('any')
url="https://github.com/embark-theme/vim"
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

package_vim-embark-git() {
  optdepends=('vim-airline-embark: Matching Airline colorscheme'
              'vim-lightline-embark: Matching Lightline colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dm 644 colors/embark.vim "$pkgdir/usr/share/vim/vimfiles/colors/embark.vim"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-airline-embark-git() {
  depends=('vim-airline')
  optdepends=('vim-embark: Base vim colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dm 644 autoload/airline/themes/embark.vim "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/embark.vim"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-lightline-embark-git() {
  depends=('vim-lightline-git')
  optdepends=('vim-embark: Base vim colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dm 644 autoload/lightline/colorscheme/embark.vim "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/embark.vim"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
