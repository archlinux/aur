# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.9.1
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('3de447237ce5293a4c95c86c4debc57f')
sha1sums=('f9b7c99834ad83def2ad201438f76b06093e1ecf')
sha512sums=('c2b8598d4a750e9462bafbeb4e3561cba8359f85dcb6d2a7946267cda0b57a08a300c02f56fd70fd39e2f54408df95fa8d3efd01894962ec5778b4fca2c53a5e')

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
