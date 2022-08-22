# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-startuptime
pkgver=4.3.0
pkgrel=1
pkgdesc="Vim plugin for profiling startup time"
arch=('any')
url="https://github.com/dstein64/vim-startuptime"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4bb302226f738ebca190420151ce9b9aef912b20c5781a6c8e6d813d6f3c8c29')

PURGE_TARGETS=('tags')

package() {
	cd "$pkgname-$pkgver"
	find autoload doc lua plugin -type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
