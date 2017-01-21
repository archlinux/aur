# Maintainer: Carl George < arch at cgtx dot us >

pkgname=neovim-commentary
pkgver=1.3
pkgrel=1
pkgdesc="Comment stuff out"
arch=("any")
url="https://github.com/tpope/vim-commentary"
license=("custom:vim")
groups=("neovim-plugins")
depends=("neovim")
install="nvim-doc.install"
source=("https://github.com/tpope/${pkgname#neo}/archive/v$pkgver.tar.gz"
        "license.txt")
sha256sums=('6c790529af9db49d9156ff06301f3a1ee553f751adf044d64054cba95dee8194'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
    cd "${pkgname#neo}-$pkgver"
    install -Dm644 doc/commentary.txt "$pkgdir/usr/share/nvim/runtime/doc/commentary.txt"
    install -Dm644 plugin/commentary.vim "$pkgdir/usr/share/nvim/runtime/plugin/commentary.vim"
    install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
