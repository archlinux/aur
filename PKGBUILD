# Maintainer: David Thurstenson <thurstylark@gmail.com>
pkgname=vim-ale
pkgver=1.3.0
pkgrel=1
pkgdesc="Asynchronous Lint Engine"
arch=('any')
url="https://github.com/w0rp/ale"
license=('BSD')
groups=('vim-plugins')
depends=('vim')
optdepends=('shellcheck: for sh/bash support'
	    'flake8: for python support')
source=("https://github.com/w0rp/ale/archive/v${pkgver}.tar.gz")
md5sums=('572d1ecc18aa204ac6b048269e463207')

package() {
	cd "$srcdir/ale-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -dm755 "$pkgdir/usr/share/vim/vimfiles/"
	cp -dr --no-preserve=ownership {after,ale_linters,autoload,doc,plugin} \
		"$pkgdir/usr/share/vim/vimfiles/"
}
