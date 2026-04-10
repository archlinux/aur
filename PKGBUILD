# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-lexima
pkgver=2.1.0
pkgrel=1
pkgdesc="Vim plugin for auto-closing parentheses"
arch=('any')
url="https://github.com/cohama/lexima.vim"
license=('MIT')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'LICENSE')
sha256sums=('ac89b625c26f40364d5cfdc795a44dfb5a78e295e4a5a278578002239035f515'
            'ec13c28254d4d06fd6660e6e7f9a3636f8c899f2ea53442a0789baaba29bf4bb')

package() {
    depends=('vim-plugin-runtime')

    cd "lexima.vim-$pkgver"
    find autoload doc plugin -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dvm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
