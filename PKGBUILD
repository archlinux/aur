# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-lists
pkgver=1.0
pkgrel=1
pkgdesc="A lists plugin for Vim"
arch=('any')
url="https://github.com/lervag/lists.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-wiki: Original companion plugin'
            'vim-wiki-ft: Wiki filetype plugin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2676d66e8f95d1b9726551d0f16f18f3216b51b00b344b445cff597414b39724')

package() {
  cd "lists.vim-$pkgver"
  find autoload doc plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
