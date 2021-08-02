# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-yui-git
pkgver=r120.131e5d6
pkgrel=1
pkgdesc="Minimal vim colorscheme focused on diffs"
arch=('any')
url="https://github.com/cidem/yui"
license=('unknown')
groups=('vim-plugins')
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
	install -Dm 644 colors/yui.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
	install -Dm 644 doc/yui.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
