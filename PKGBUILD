# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-notify
pkgver=1.15.0
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
sha256sums=('ff64466078caeba17daf5170c5ac176964c91ed9dfd8f284bf918f5f2a4e0c30')

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
