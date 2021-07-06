# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=vim-better-whitespace-git
_name="${pkgname%-git}"
pkgver=r127.8cf4b21
pkgrel=1
pkgdesc='Better whitespace highlighting for Vim'
arch=('any')
url='https://github.com/ntpeters/vim-better-whitespace'
license=('custom:Unlicense')
depends=('vim-plugin-runtime')
provides=("$_name" 'vim-trailing-whitespace')
conflicts=('vim-trailing-whitespace')
replaces=("$_name")
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 plugin/better-whitespace.vim -t "$pkgdir/usr/share/vim/vimfiles/plugin/"
	install -Dm644 doc/better-whitespace.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
