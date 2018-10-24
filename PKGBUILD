# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=luksmeta
pkgver=9
pkgrel=1
pkgdesc='Library for storing metadata in the LUKSv1 header'
arch=('x86_64')
url='https://github.com/latchset/luksmeta'
license=('LGPL')
depends=('cryptsetup')
makedepends=('asciidoc')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('eeecc3de9d621c380d29b2f2ca6ce715f09c20aac8ffc6a3d3cc7dc30c5dc46df686e61928d0accf7e7281ad9baa6ee59a0cf5b58635a311769d8e08c5cc94bd')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
