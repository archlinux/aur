# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-envy-git
pkgver=r47.e1afb0c
pkgrel=1
pkgdesc="Light colorscheme for Vim with comfortable contrast"
arch=('any')
url="https://github.com/kkga/vim-envy"
license=('MPL2')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dvm 644 colors/envy.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
	install -Dvm 644 envy.colortemplate -t "$pkgdir/usr/share/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
