# Maintainer: Luis Martinez <luis dot martinez at tuta dot>

pkgname=neovim-registers
pkgver=1.1.0
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('93ac5156c8e3005cdbca85db79021eb896be23771ee22f27a3dfbdd3e8428340')

package() {
  cd "registers.nvim-$pkgver"
  find lua plugin syntax \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
