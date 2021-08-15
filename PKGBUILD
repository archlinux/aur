# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-embark-git
pkgver=r60.03029f4
pkgrel=1
pkgdesc="A deep inky purple theme leveraging bright colors"
arch=('any')
url="https://github.com/embark-theme/vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=('vim-embark' 'vim-airline-embark' 'vim-lightline-embark')
conflicts=('vim-embark' 'vim-airline-embark' 'vim-lightline-embark')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload colors -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
