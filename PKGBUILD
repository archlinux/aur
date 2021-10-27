# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Springer <felixspringer149@gmail.com>

pkgname=vim-wolfram-git
pkgdesc="Syntax Highlighting for Wolfram Language in Vim"
pkgver=r17.cfc6118
pkgrel=1
arch=('any')
url="https://github.com/arnoudbuzing/wolfram-vim"
license=('unknown')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 colors/wolframlanguage.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
	install -Dm 644 syntax/wl.vim -t "$pkgdir/usr/share/vim/vimfiles/syntax/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
