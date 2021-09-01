# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-suda
pkgver=0.3.2
pkgrel=1
pkgdesc="Vim plugin for writing out files with sudo"
arch=('any')
url="https://github.com/lambdalisue/suda.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'sudo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('46d48c47f4368be505ae04ffc2d0428766751b2e99cb62ad52fe80c5fb525bdb')

package() {
	cd "suda.vim-$pkgver"
	find autoload doc plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
