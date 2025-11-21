# Maintainer: Dario Spinnato <dario.spinnato07@gmail.com>
_pkgname='geteduroam'
pkgname="$_pkgname-gui"
pkgver=0.12
pkgrel=1
pkgdesc="A gui to automatically setup eduroam"
arch=(x86_64 aarch64)
url="https://github.com/geteduroam/linux-app"
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
license=('BSD-3-Clause')
makedepends=('go>=1.18')
depends=('networkmanager' 'gtk4>=4.06' 'libadwaita>=1.1')
sha256sums=('25b367d30efa3bba0ca414ff29b80f7e49cf2fa5f252d1e47ee49e59e9db5ff8')

build() {
	cd "$srcdir/linux-app-$pkgver"
	make build-gui
}

package() {
	cd "$srcdir/linux-app-$pkgver"
	install -D geteduroam-gui "$pkgdir/usr/bin/geteduroam-gui"
}
