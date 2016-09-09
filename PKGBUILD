# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=unyaffs
pkgver=0.9.6
pkgrel=1
pkgdesc="A program to extract files from a yaffs image"
arch=("i686" "x86_64")
url="https://github.com/ehlers/unyaffs"
license=(GPL)
depends=('glibc')

source=(https://github.com/ehlers/unyaffs/archive/$pkgver/$pkgname-$pkgver.tar.gz)

sha256sums=('33c46419ab5cc5290f3b780f0cc9d93729962799f5eb7cecb9b352b85939fbbf')

build() {
	cd $pkgname-$pkgver
	make unyaffs
}

package() {
	cd $pkgname-$pkgver
	install -D -m 0755 unyaffs "$pkgdir"/usr/bin/unyaffs
}
