# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.10.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('75b02f24054223dcd97211907d022934')
sha1sums=('cf12baa4a0e35a38c551334eba73cce270787073')
sha512sums=('482a799ddc460651b2b9ad799fea6816d075720b16d6e571e839e85d0d53ca73a6786f08d717b80ccd3fdb49523dddd9db4f43e0bed242bcc8cc0ec7b7dbc7b6')

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
