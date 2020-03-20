# Maintainer: Guillaume Michaud <michaudg@gmail.com>

pkgname=xow
pkgver=0.4
pkgrel=1
pkgdesc='Linux driver for the Xbox One wireless dongle'
arch=('x86_64')
url='https://github.com/medusalix/xow'
license=('GPL2')
depends=('libusb')
conflicts=('xow-git')
install=$pkgname.install
source=("https://github.com/medusalix/xow/archive/v${pkgver}.tar.gz")
md5sums=('1f9d50b1e4ed2346532cb38678300e91')

build() {
	cd "$pkgname-$pkgver"
	make BUILD=RELEASE
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR=$pkgdir/usr PREFIX="" install
}
