# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.2.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('Apache')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('d13d76aacb3bf784372d4d6662111aff')
sha1sums=('650268c21c3b5d6ad83c434f51c4fdf84fab5c64')
sha512sums=('df08cbe8fb72355e9f1108185684fbf85df68156801d7e25fdde83e288a14e8ddc9f2827e737468306569e263ccd47af084ed2c7780951b2c154bf671408b868')

package() {
	cd "$pkgname-$pkgver"

	cargo build --release --locked
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
