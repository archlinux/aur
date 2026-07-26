# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-css3
pkgver=2.10.0
pkgrel=1
pkgdesc="CSS3 syntax support for Vim's built-in syntax/css.vim"
arch=('any')
url="https://github.com/hail2u/vim-css3-syntax"
license=('MIT')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'LICENSE-MIT')
sha256sums=('f94a7874b62726401ce9849715abc3b431f2bb0b2698bc4a312f29bd6a2bcbc6'
            'f9d0ceffd2af773e944903a413b8d40527f1425ec68daf8b39515ec4eda87137')

package() {
    depends=('vim-plugin-runtime')
    cd "vim-css3-syntax-$pkgver"
    find after -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
