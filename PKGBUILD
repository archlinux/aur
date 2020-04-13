# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=vim-asyncomplete
pkgver=2.1.0
pkgrel=1
pkgdesc="Async autocompletion for Vim 8 and Neovim with timers"
arch=('any')
url="https://github.com/prabirshrestha/asyncomplete.vim"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha512sums=('9a2d67a99d8a8a692156d79c52fea996e21d8ba93028b573c43e7a6c9c767ef451a6cc5cb5c76440dae424c67275068dba7d691b86f667f5807436b264755cec')

package() {
	cd "asyncomplete.vim-$pkgver"

	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	# Install vimfiles
	local vimfiles="$pkgdir/usr/share/vim/vimfiles"
	mkdir -p "$vimfiles"
	cp -dr --no-preserve=ownership autoload "$vimfiles"
	cp -dr --no-preserve=ownership doc "$vimfiles"
	cp -dr --no-preserve=ownership plugin "$vimfiles"
}
