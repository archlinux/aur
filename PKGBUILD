# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-dadbod-git
pkgver=1.4.r3.g8fcde4c
pkgrel=1
pkgdesc="Modern database interface for Vim"
arch=('any')
url="https://github.com/tpope/vim-dadbod"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find autoload doc plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
}
