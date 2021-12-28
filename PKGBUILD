# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-aquarium
pkgver=0.3.7
pkgrel=1
pkgdesc="Vibrant dark colorscheme"
arch=('any')
url="https://github.com/frenzyexists/aquarium-vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
provides=(
	'vim-airline-aquarium'
	'vim-lightline-aquarium'
	'neovim-lualine-aquarium')
conflicts=(
	'vim-airline-aquarium'
	'vim-lightline-aquarium'
	'neovim-lualine-aquarium')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3fe6dfe0cdb26cb4b00e4eb35ff231cf3453a79964401945983ad8e46db82498')

package() {
	cd "aquarium-vim-$pkgver"
	find autoload colors lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
