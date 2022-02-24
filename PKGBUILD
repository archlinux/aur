# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.11.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://codeberg.org/flausch/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('6d0d504af75a8e116d1f8be126e2dfe2')
sha1sums=('856f0d7ad5e7cf7b2d9dbc67811f31cacdc05a04')
sha512sums=('20d2567be7157eea044a22a4e3dca7b1702baa8379a8b73f3c9e945d7a3474b128e5f3fc2750fc0cf9467d2bc22493121070bc69e22911d3d8b1838ae9c43f79')

build() {
	cd "$pkgname"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
