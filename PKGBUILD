# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-notify
pkgver=1.8.2
pkgrel=1
pkgdesc="Notification manager for Neovim"
arch=('any')
url="https://github.com/rcarriga/nvim-notify"
license=('unknown')
groups=('neovim-plugin')
depends=('neovim')
# optdepends=('neovim-telescope') ## not yet
install=notify.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('37d460afeaa709004185a94ab5bb25f084425028df1447d40b49bdec4fd582d1')

package() {
	cd "nvim-notify-$pkgver"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
