# Maintainer: Jocelyn Meyron <jmeyron@gmail.com>

pkgname=geomview
pkgver=1.9.5
pkgrel=1
pkgdesc="Interactive 3D viewing program for Unix"
arch=('i686' 'x86_64')
url="http://www.geomview.org/"
license=('GPL')
depends=('openmotif' 'glu')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=("98ada147dfcbabca7c48137590e74a85")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname
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

