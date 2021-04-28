# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgbase=vim-fern
pkgname=('vim-fern' 'neovim-fern')
pkgver=1.34.0
pkgrel=1
pkgdesc="A general purpose asynchronous tree viewer"
arch=('any')
url="https://github.com/lambdalisue/fern.vim"
license=('MIT')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ea4aa7ab02a8727eadaec1c12478ee9a573797eb5e3b7280ee0427e8ce7a334')

package_vim-fern() {
  depends=('vim>=8.1')
  groups=('vim-plugins')

  cd "fern.vim-$pkgver"
  find autoload doc ftplugin plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-fern() {
  depends=('neovim>=0.4.4' 'neovim-fix-cursorhold')
  groups=('neovim-plugins')

  cd "fern.vim-$pkgver"
  find autoload doc ftplugin plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
