# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-fern
pkgname=('vim-fern' 'neovim-fern')
pkgver=1.38.0
pkgrel=1
pkgdesc="A general purpose asynchronous tree viewer"
arch=('any')
url="https://github.com/lambdalisue/fern.vim"
license=('MIT')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8b214bbd44d31a9ab051318cda1c707d0c44fa64fa3234a7bf91720959a1c2c4')

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
