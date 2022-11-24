# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.12.1
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('b424e6aab38a457625289fd3e8499015')
sha1sums=('c683c91e8a7efe5efb1e3edadfedc957d095bc5f')
sha512sums=('38eed1d28525a308d4b9d0ca5ece38e2034899aa0dbc261416f5f28d1cdd3f874758933511fd460dae56431de458e7c6c53a36509a7f8f378ce23e370a6a3291')

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
