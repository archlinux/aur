# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-melange
pkgver=0.3.0
pkgrel=1
pkgdesc="Warm colorscheme for Neovim and beyond"
arch=('any')
url="https://github.com/savq/melange"
license=('MIT')
groups=('vim-plugins' 'neovim-plugins')
depends=('vim-plugin-runtime')
provides=('neovim-melange')
conflicts=('neovim-melange')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7cd8fbdcfdf4aef2cadcaf1f80d0a814e338d0909e98591e61501e9d8a06a1a2')

package() {
  cd "melange-$pkgver"
  find colors lua \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
