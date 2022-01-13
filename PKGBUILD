# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-wheel
pkgver=2.10.3
pkgrel=1
pkgdesc="Quick navigation framework for Vim and Neovim"
arch=('any')
url="https://github.com/chimay/wheel"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "LICENSE")
sha256sums=('169549a2e8994aec143f875f9cf6799a5e9dcd02d06d0da4fd9817c8220b5b8e'
            'b801c8d677ef9701149e05cf98f28b82a56832dd67c94d96d36d25d063b1b353')

package() {
	cd "wheel-$pkgver"
	find after autoload doc plugin \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
