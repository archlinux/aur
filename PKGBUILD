# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-toast-git
pkgver=r22.6ef5cea
pkgrel=1
pkgdesc="A colorful, medium-contrast colorscheme based on Tomorrow"
arch=('any')
url="https://github.com/jsit/toast.vim"
license=('unknown')
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
	install -Dvm 644 colors/toast.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
