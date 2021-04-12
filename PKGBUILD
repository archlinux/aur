# Maintainer: lmartinez-mirror
pkgname=neovim-registers
pkgver=0.2.4
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('vim-plugins')
depends=('neovim-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77fbbd0b3e77b6a704fda1a44cb2c34e840211c61a859789b3c29f7fe88e9334')

package() {
  cd "registers.nvim-$pkgver"
  find lua plugin syntax \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
