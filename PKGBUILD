# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.12.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('a50e38dfe31af536ae5e972e4abb7b0e')
sha1sums=('6ba86b1f50ea3c49a8c88764b2a7c6ae1a3bb3d5')
sha512sums=('b47f73e5ca578fc55360021aa6be0d569fe14e4804c4d2314aca74c49ec936773da34aadf5e0f263b59b938eac157f985d51b7f63b4bccb3e753889d437addd1')

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
