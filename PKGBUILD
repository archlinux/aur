# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-indent-blankline
pkgver=3.9.1
pkgrel=1
pkgdesc="Indent guides for Neovim"
arch=('any')
url="https://github.com/lukas-reineke/indent-blankline.nvim"
license=('MIT')
groups=('neovim-plugins')
install=indent-blankline.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0a4597f6bd621a48107d9a4f66cdac31012c08648f8fb9cfb3016dde645fd369')

package() {
    depends=('neovim')
    cd "indent-blankline.nvim-$pkgver"
    local dirs=(after doc lua specs)
    find "${dirs[@]}" \
        -type f \
        -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
