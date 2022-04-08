# Maintainer: Jonathon Fernyhough <jonathon_at_m2x+dev>

pkgname=julia-loadpath
pkgver=1.0.1
pkgrel=1
pkgdesc="Add a system-wide package directory to the JULIA_LOAD_PATH"
arch=(any)
url="https://gitlab.com/jonathon/$pkgname"
license=(GPL3)
optdepends=(julia)
install=julia-loadpath.install

source=($pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('1a2112f395d8bc79b4b5a21600ecbeb68fabbf104b8810b6c16f42abcde4f36f')

package() {
	cd $pkgname-$pkgver
	install -D julia-load-path.csh $pkgdir/etc/profile.d/julia-load-path.csh
	install -D julia-load-path.sh  $pkgdir/etc/profile.d/julia-load-path.sh
}
