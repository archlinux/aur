# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-fern
pkgname=('vim-fern' 'neovim-fern')
pkgver=1.38.1
pkgrel=1
pkgdesc="A general purpose asynchronous tree viewer"
arch=('any')
url="https://github.com/lambdalisue/fern.vim"
license=('MIT')
optdepends=('gomi: trash-bin functionality'
            'trash-cli: trash-bin functionality')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('42013a349a579c2c0755b7e4cf8fdf0614bd7a7c8c198bc03abe8a1f3928d324')

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
