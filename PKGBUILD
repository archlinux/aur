# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-srcery
pkgver=1.0.0
pkgrel=1
pkgdesc="Dark colorscheme with contrasting colors and a slightly earthy tone"
arch=('any')
url="https://github.com/srcery-colors/srcery-vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
provides=('vim-airline-srcery' 'vim-lightline-srcery' 'vim-clap-srcery')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f1ceb3735e578ca99db366e8df1f534f76455fd17f9bd0b5cfdef6e05d8e90a8')

package() {
	cd "srcery-vim-$pkgver"
	find autoload colors doc -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
