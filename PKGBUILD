# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.9.1
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://codeberg.org/flausch/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('852d336e07cbce295f19e868ba5152ae')
sha1sums=('2695f33f605e88c71b1186db0ec28a8a29fb1ce3')
sha512sums=('cb4ae7a4c43f62c95272285d11109994c7c52fe075f51cc529bff4a6a2eea7d170ced6dbb95c654f5c6c83b62bbfcac1053558bd707494fbf119f1bedb339da6')

build() {
	cd "$pkgname"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
