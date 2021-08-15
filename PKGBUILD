# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-tender-git
pkgver=r132.7746453
pkgrel=1
pkgdesc='A 24-bit colorscheme'
arch=('any')
url="https://github.com/jacoborus/tender.vim"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-airline-tender' 'vim-lightline-tender')
conflicts=("${pkgname%-git}")
replaces=('vim-airline-tender-git' 'vim-lightline-tender-git')
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
