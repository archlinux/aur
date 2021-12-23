# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.8.0
pkgrel=2
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('896b5b0363d81a61c794bd3aafc6218f')
sha1sums=('8b31226d8b7b50006ec6d72ae5c8d943c8efb7f7')
sha512sums=('3db514db6cb0c998cdf24c0ae87296fc7933b418a14772a9809c0689465a0e89400b3e8c1e6b24dbfdf399d41ac6baaa9d64e36ca4b6317e3a28eb1b664e28f0')

package() {
	cd "$pkgname-$pkgver"

	export RUSTFLAGS='--cap-lints=allow'
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
