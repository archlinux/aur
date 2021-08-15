# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-code-dark-git
pkgver=r105.670fed5
pkgrel=1
pkgdesc="A dark colorscheme for Vim inspired by Dark+ in VSCode"
arch=('any')
url="https://github.com/tomasiser/vim-code-dark"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=('vim-code-dark' 'vim-airline-code-dark' 'vim-lightline-code-dark')
conflicts=('vim-code-dark' 'vim-airline-code-dark' 'vim-lightline-code-dark')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload colors -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
