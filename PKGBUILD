# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.9.0
pkgrel=2
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('d3231c30e590b3a2d7ed116cfdcf8bc9')
sha1sums=('01a98fbc6ccb8b737bfa6a807562b061b294dd0e')
sha512sums=('1fbc74de8d9348cacfda0b56993b234a36d9f77625d52ca1fac582e8548f425eb30abd72b273074aa6f52d029dce92a8f7be45ccc96676dbf38400b7333345cf')

package() {
	cd "$pkgname-$pkgver"

	export RUSTFLAGS='--cap-lints=allow'
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
