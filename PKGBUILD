# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.9.1
pkgrel=2
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://codeberg.org/flausch/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('09490297f446b88fadc180fd3cf3760f')
sha1sums=('f3f529b9d0c14a8661bbdc457b3e92ac5d8d6b53')
sha512sums=('c9ed128d045aeb1417d13cdcf6ec7b23052666a0393d7e3e5c3545e6d9690723bb53ecd9cdce4313089bf7c07a8bcc279188d291da2cc0ac2e65e30c1ec30470')

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
