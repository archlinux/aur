# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-neomake-git
pkgver=r2741.8df87617
pkgrel=1
pkgdesc="Asynchronous linting and make framework for Neovim/Vim"
arch=('any')
url="https://github.com/neomake/neomake"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	find autoload doc plugin syntax -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
}
