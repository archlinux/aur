# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-notify
pkgver=3.2.2
pkgrel=1
pkgdesc="Notification manager for Neovim"
arch=('any')
url="https://github.com/rcarriga/nvim-notify"
license=('MIT')
groups=('neovim-plugin')
depends=('neovim')
optdepends=('neovim-telescope')
checkdepends=('neovim-plenary')
install=notify.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('134917446a99f686d881a167d28abab13b83415b86d9280ff0a312e99d6d1f0d')

check() {
	cd "nvim-notify-$pkgver"
	./scripts/test
}

package() {
	cd "nvim-notify-$pkgver"
	find doc lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
