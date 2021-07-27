# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-gemini-git
pkgver=r11.596d1f3
pkgrel=1
pkgdesc="Vim syntax highlighting for text/gemini files"
arch=('any')
url="https://tildegit.org/sloum/gemini-vim-syntax"
license=('Unlicense')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find ftdetect syntax -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
