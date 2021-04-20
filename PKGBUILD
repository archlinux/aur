# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgbase=vim-miramare-git
pkgname=('vim-miramare-git'
         'vim-airline-miramare-git'
         'vim-lightline-miramare-git')
pkgver=r26.a2abfb8
pkgrel=1
pkgdesc="Comfortable and pleasant colorscheme for Vim"
arch=('any')
url="https://github.com/franbach/miramare"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-miramare-git()  {
  optdepends=('vim-airline-miramare: Airline theme'
              'vim-lightline-miramare: Lightline theme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 colors/miramare.vim "$pkgdir/usr/share/vim/vimfiles/colors/miramare.vim"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-airline-miramare-git()  {
  depends=('vim-airline')
  optdepends=('vim-miramare: Base vim colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/airline/themes/miramare.vim "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/miramare.vim"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_vim-lightline-miramare-git()  {
  depends=('vim-lightline-git')
  optdepends=('vim-miramare: Base vim colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/lightline/colorscheme/miramare.vim "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/miramare.vim"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}