# Maintainer: Mitch Bigelow <ipha00@gmail.com>
pkgname=pixiewps
pkgver=1.2.2
pkgrel=1
pkgdesc="Offline bruteforce of the WPS pin exploiting the low or non-existing entropy of some APs"
arch=('i686' 'x86_64')
url="https://github.com/wiire/pixiewps"
license=('GPL')
depends=('openssl')
source=(https://github.com/wiire/pixiewps/archive/v$pkgver.tar.gz)
sha256sums=('6da09b8ac67cd556b901606e5a72548174cd1e6a89cc52a246d49e0a5ff83db8')

build() {
	cd "$pkgname-$pkgver"/src
	make
}

package() {
	cd "$pkgname-$pkgver"/src
	make PREFIX="$pkgdir/usr" install
}
