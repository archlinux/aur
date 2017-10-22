# Maintainer: Niklas <dev@n1klas.net>

pkgname=libmicrodns
pkgver=0.0.8
pkgrel=1
pkgdesc="Minimal mDNS resolver library"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/videolabs/libmicrodns"
license=('LGPL2.1')
depends=('glibc')
source=("https://github.com/videolabs/libmicrodns/archive/${pkgver}.tar.gz")
sha512sums=('de66cc802cda0ae0728a0eb114234f6d516088dc37622ee07c0b8c7a425ab8deee888992d9b62c79f1a97da3e9772e8dd5724446e91999f19c3979b4fd70ed3a')

build() {
	cd "$pkgname-$pkgver"
    ./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
