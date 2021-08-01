# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-yin-yang-git
pkgver=r32.77ed628
pkgrel=1
pkgdesc="Low contrast black/white colorscheme for Vim"
arch=('any')
url="https://github.com/pgdouyon/vim-yin-yang"
license=('MIT')
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
	install -Dm 644 colors/{yin,yang}.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
