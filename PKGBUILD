# Maintainer: Dario Spinnato <dario.spinnato07@gmail.com>
_pkgname='geteduroam'
pkgname="$_pkgname-cli"
pkgver=0.12
pkgrel=1
pkgdesc="A cli to automatically setup eduroam"
arch=(x86_64 aarch64)
url="https://github.com/geteduroam/linux-app"
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
license=('BSD-3-Clause')
makedepends=('go>=1.18')
depends=('networkmanager')
sha256sums=('25b367d30efa3bba0ca414ff29b80f7e49cf2fa5f252d1e47ee49e59e9db5ff8')

build() {
	cd "$srcdir/linux-app-$pkgver"
	make build-cli
}

package() {
	cd "$srcdir/linux-app-$pkgver"
	install -D geteduroam-cli "$pkgdir/usr/bin/geteduroam-cli"
}
