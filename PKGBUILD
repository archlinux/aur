# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-registers
pkgver=2.3.0
pkgrel=2
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://codeberg.org/fosk/registers.nvim"
license=('GPL-3.0-or-later')
groups=('neovim-plugins')
install=registers.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d617bdc1cc1715f0f97f320182828ca10c2a0fc0e6b571ef745676413be4d8e4')

package() {
    depends=('neovim')
    cd "registers.nvim"
    find doc lua plugin \
        -type f \
        -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
