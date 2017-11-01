# Maintainer: GreaterFire <GreaterFire at protonmail dot com>
pkgname=trojan
pkgver=0.3.0
pkgrel=1
pkgdesc="An unidentifiable mechanism that helps you bypass GFW."
arch=('any')
url="https://github.com/GreaterFire/trojan"
license=('GPL')
depends=('boost-libs' 'openssl')
makedepends=('cmake' 'boost' 'openssl')
source=("https://github.com/GreaterFire/$pkgname/archive/v$pkgver.tar.gz")
backup=('etc/trojan.json' 'etc/systemd/system/trojan.service')
md5sums=('29693e17f6ab4bbc0ef23b63f682dfde')
build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
