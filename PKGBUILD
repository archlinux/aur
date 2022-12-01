# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-startuptime
pkgver=4.3.0
pkgrel=2
pkgdesc="Vim plugin for profiling startup time"
arch=('any')
url="https://github.com/dstein64/vim-startuptime"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ace2996488de287620c0ba85d70700564f2fefb20438c0aa8e3101fb100e2437')

PURGE_TARGETS=('tags')

package() {
	cd "$pkgname-$pkgver"
	find autoload doc lua plugin -type f \
		-exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
