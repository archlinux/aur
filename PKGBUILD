# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-srcery
pkgver=3.0.0
pkgrel=1
pkgdesc="Dark colorscheme with contrasting colors and a slightly earthy tone"
arch=('any')
url="https://github.com/srcery-colors/srcery-vim"
license=('MIT')
groups=('vim-plugins')
provides=('vim-airline-srcery' 'vim-lightline-srcery' 'vim-clap-srcery' 'vim-lualine-srcery')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0407ffddcd2b7219339fe066162a1d32da0ccf5d91bbfdaaec66d24ddc7bc897')

package() {
    depends=('vim-plugin-runtime')
    cd "srcery-vim-$pkgver"
    find autoload colors doc lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
