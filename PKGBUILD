# Maintainer: GreaterFire <GreaterFire at protonmail dot com>
pkgname=trojan
pkgver=0.3.0
pkgrel=3
pkgdesc="An unidentifiable mechanism that helps you bypass GFW."
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/GreaterFire/trojan"
license=('GPL')
depends=('boost-libs' 'openssl')
makedepends=('cmake' 'boost' 'openssl')
source=("https://github.com/GreaterFire/$pkgname/archive/v$pkgver.tar.gz")
backup=('etc/trojan.json' 'etc/systemd/system/trojan.service')
md5sums=('a1936fa297762a9a0cf8427d5aad4508')
build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
