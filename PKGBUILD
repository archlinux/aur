# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgbase=vim-fern
pkgname=('vim-fern' 'neovim-fern')
pkgver=1.37.0
pkgrel=1
pkgdesc="A general purpose asynchronous tree viewer"
arch=('any')
url="https://github.com/lambdalisue/fern.vim"
license=('MIT')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9eb6ab14d8a57f95164cb237da27dd8363ebfd9abd2b03ede4c3b2f914bb63ce')
validpgpkeys=('4AEE18F83AFDEB23')

package_vim-fern() {
  depends=('vim>=8.1')
  groups=('vim-plugins')

  cd "fern.vim-$pkgver"
  find autoload doc ftplugin plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-fern() {
  depends=('neovim>=0.4.4' 'neovim-fix-cursorhold')
  groups=('neovim-plugins')

  cd "fern.vim-$pkgver"
  find autoload doc ftplugin plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
