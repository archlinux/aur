# Maintainer: lmartinez-mirror
pkgname=neovim-registers
pkgver=0.2.6
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('vim-plugins')
depends=('neovim>=0.4.4')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('baa0697cd0206e52836889c2f43848caf13448386499d576d3b6ce9fe377ff4b')

package() {
  cd "registers.nvim-$pkgver"
  find lua plugin syntax \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
