# Maintainer: Guillaume Michaud <michaudg@gmail.com>

pkgname=xow
pkgver=0.5
pkgrel=1
pkgdesc='Linux driver for the Xbox One wireless dongle'
arch=('x86_64')
url='https://github.com/medusalix/xow'
license=('GPL2')
depends=('libusb' 'cabextract')
conflicts=('xow-git')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/medusalix/xow/archive/v$pkgver.tar.gz")
md5sums=('37193261c48ec5d3e703f5a045e7427f')

build() {
	cd "$pkgname-$pkgver"
	make BUILD=RELEASE
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR=$pkgdir/usr PREFIX="" install
}
