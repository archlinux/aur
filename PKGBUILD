# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-melange
_pkgver=2025-07-10
pkgver="${_pkgver//-/}"
pkgrel=1
pkgdesc='Warm colorscheme for Neovim and beyond'
arch=('any')
url="https://github.com/savq/melange-nvim"
license=('MIT')
groups=('neovim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_pkgver}.tar.gz")
sha256sums=('32ad1a6403cb9cef23b4efda82f25fe86b29fefdf3e151fe1abbde7d6f69ce0e')

package() {
    depends=('neovim')

    cd "melange-nvim-$_pkgver"
    find autoload colors lua \
        -type f \
        -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    find term -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

