# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-srcery
pkgver=2.1.0
pkgrel=1
pkgdesc="Dark colorscheme with contrasting colors and a slightly earthy tone"
arch=('any')
url="https://github.com/srcery-colors/srcery-vim"
license=('MIT')
groups=('vim-plugins')
provides=('vim-airline-srcery' 'vim-lightline-srcery' 'vim-clap-srcery' 'vim-lualine-srcery')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('65b83a53d61d3571d5f3413e5f2cfff0071395bba482c7c1e35aef647ba58f00')

package() {
    depends=('vim-plugin-runtime')
    cd "srcery-vim-$pkgver"
    find autoload colors doc lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
