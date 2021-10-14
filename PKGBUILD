# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp-emoji-git
pkgver=r4.19075c3
pkgrel=1
pkgdesc="nvim-cmp source for emoji"
arch=('any')
url="https://github.com/hrsh7th/cmp-emoji"
license=('custom:unknown')
groups=('neovim-plugin')
depends=('neovim-cmp')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=cmp-emoji.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$pkgname"
	find after lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

