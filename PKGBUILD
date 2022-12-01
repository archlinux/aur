# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.10.2
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/swsnr/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('660e9fcb8513a73fe0cae75d93767f7b')
sha1sums=('33590ce816e79971222354a867145a05a87def81')
sha512sums=('b36808fa0cf5b74a50b3f9a73be74335649dc2ee96e4a209d9fa7cebf257b96f270dcbf620e1900a11f2878d10b4e1122eb7b1265a8a6a782bc0fbe67676f9a0')

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
