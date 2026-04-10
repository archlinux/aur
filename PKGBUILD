# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-wheel
pkgver=3.8
pkgrel=1
pkgdesc="Quick navigation framework for Vim and Neovim"
arch=('any')
url="https://github.com/chimay/wheel"
license=('BSD-3-Clause')
groups=('vim-plugins')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d088a38b7239ca20f8cd8b49bfe14b48b8ec8029d9231752e0ebf9a1ae6c5ba3')

package() {
    depends=('vim-plugin-runtime')
    cd "wheel-$pkgver"
    find after autoload doc plugin \
        -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
