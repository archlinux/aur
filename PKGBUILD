# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.11.2
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://codeberg.org/flausch/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('4e694f2d14c07f7e2539a8c29938b301')
sha1sums=('368da3d4c37579d1f0e126ef60247a28a6fa56fb')
sha512sums=('339a379a79073c051c10edd5a1531c837990f0a264b4b7accc6c3fe619ef88b8b1fcc37feb5738f1fd056fe9dff80947faf7bd27e93dbbd0ea0e6c0191597e75')

build() {
	cd "$pkgname"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
