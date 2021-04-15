# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.1.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('Apache')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('8f62b523a35ac54eb5b7409d479f0cf5')
sha1sums=('bbad2bddc5d35d9d46ddac664a62a7f928a12258')
sha512sums=('8c2a15ad2105bc13db3b31c8a1903707225b92eb8e69968d4ac53cddf1f510a2d8b4ad954e8c6ea9d8fab84c80016b2ea5aac0142f4324529a11c6192f9c1419')

package() {
	cd "$pkgname-$pkgver"

	cargo build --release --locked
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
