# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-lexima-git
pkgver=1.2.0.r14.g6b716e2
pkgrel=1
pkgdesc="Vim plugin for auto-closing parentheses"
arch=('any')
url="https://github.com/cohama/lexima.vim"
license=('unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find autoload doc plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
