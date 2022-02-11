# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-suda
pkgver=0.3.3
pkgrel=1
pkgdesc="Vim plugin for writing out files with sudo"
arch=('any')
url="https://github.com/lambdalisue/suda.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'sudo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('275c7e9551824f28a1bdc21db3b8c6586f0dea11d525ab74f922c491edbde88d')

package() {
	cd "suda.vim-$pkgver"
	find autoload doc plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
