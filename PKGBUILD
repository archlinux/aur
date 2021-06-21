# Maintainer: lmartinez-mirror
pkgname=neovim-registers
pkgver=0.3.1
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('vim-plugins')
depends=('neovim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('82584cc19ae66bfb590fab40a22e1565c8772f183b98dd607a8dc829862660ad')

package() {
  cd "registers.nvim-$pkgver"
  find lua plugin syntax \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
