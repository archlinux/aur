# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.12.2
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('adac7e6a93fc85d5830b74be91d58896')
sha1sums=('05eb483192017737cdcc74a532777792ade6a506')
sha512sums=('12ccc95ac941fe5693356e65c49ffde04187103782f72ddac80e28cd8504897f01b1acebc3c692774c96c88599b507afc9291cafa78faf10af3dce4cacb88066')

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS='--cap-lints=allow'
	make PREFIX="/usr" build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
