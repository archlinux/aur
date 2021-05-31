# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-photon-git
pkgver=r41.0b08dd6
pkgrel=1
pkgdesc="An elegant pair of Vim colorschemes with minimal syntax highlighting"
arch=('any')
url="https://github.com/axvr/photon.vim"
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
	install -Dvm 644 colors/photon.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
	install -Dvm 644 colors/antiphoton.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
