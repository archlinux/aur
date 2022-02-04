# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.8.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://codeberg.org/flausch/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('d13661e06cd357e03c3d5136dc54a053')
sha1sums=('5eb093b3bbd7f27a73acf6232ce3218693c0084c')
sha512sums=('023d8f7ae32065b31d5bf583941f41d498cf78a64332053a12649a838c2aca2e58c0c6cc9d51b095d9e5f7d263453f8aa6054a60f842ce24c5484aaeb38afd57')

build() {
	cd "$pkgname"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
