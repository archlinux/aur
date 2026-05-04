# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-css3
pkgver=2.9.1
pkgrel=1
pkgdesc="CSS3 syntax support for Vim's built-in syntax/css.vim"
arch=('any')
url="https://github.com/hail2u/vim-css3-syntax"
license=('MIT')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fe7d0fb2af18d66e8aa4f5de815b843b85f49f6b00088a42ff2c727f6b796871')

package() {
    depends=('vim-plugin-runtime')
    cd "vim-css3-syntax-$pkgver"
    find after -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
