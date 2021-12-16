# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-asyncrun
pkgver=2.9.1
pkgrel=1
pkgdesc="Vim plugin for executing shell commands asynchronously"
arch=('any')
url="https://github.com/skywind3000/asyncrun.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('700c75786caf5ab378bce913dc24f37ab6809074cc368b0640b1ed75665e1890')

package() {
	cd "asyncrun.vim-$pkgver"
	find autoload plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 doc/asyncrun.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
