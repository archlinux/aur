# Maintainer: GreaterFire <GreaterFire at protonmail dot com>
pkgname=trojan
pkgver=0.2.1
pkgrel=1
pkgdesc="An unidentifiable mechanism that helps you bypass GFW."
arch=('any')
url="https://github.com/GreaterFire/trojan"
license=('GPL')
depends=('boost-libs' 'openssl')
makedepends=('cmake' 'boost' 'openssl')
source=("https://github.com/GreaterFire/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7aeb37c78788e21265cbb7a106b01bc5')
build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
