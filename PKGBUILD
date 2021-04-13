# Maintainer: lmartinez-mirror
pkgname=neovim-registers
pkgver=0.2.5
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('vim-plugins')
depends=('neovim-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8eef3aee9d5705078f8870b71972055a3bc5c619d620668a9b2bbf41b1467c98')

package() {
  cd "registers.nvim-$pkgver"
  find lua plugin syntax \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
