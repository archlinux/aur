# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=unyaffs
pkgver=0.9.7
pkgrel=1
pkgdesc="A program to extract files from a yaffs image"
arch=("i686" "x86_64")
url="https://github.com/ehlers/unyaffs"
license=(GPL)
depends=('glibc')

source=(https://github.com/ehlers/unyaffs/archive/$pkgver/$pkgname-$pkgver.tar.gz)

sha256sums=('099ee9e51046b83fe8555d7a6284f6fe4fbae96be91404f770443d8129bd8775')

build() {
	cd $pkgname-$pkgver
	make unyaffs
}

package() {
	cd $pkgname-$pkgver
	install -D -m 0755 unyaffs "$pkgdir"/usr/bin/unyaffs
}
