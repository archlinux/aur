# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: PitBall

pkgname=vim-ack-git
pkgver=1.0.9.r19.g36e40f9
pkgrel=1
pkgdesc='Vim plugin for the Perl module ack'
arch=('any')
license=('custom:vim')
depends=('vim-plugin-runtime' 'ack')
makedepends=('git')
url='https://github.com/mileszs/ack.vim'
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/-/.r/;s/-/./;'
}

package() {
	cd "$pkgname"
	find autoload doc ftplugin plugin \
	  -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
