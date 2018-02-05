# Maintainer: Zdenek Janak <janak@astronomie.cz>
pkgname=munipack
pkgver=0.5.10
pkgrel=1
pkgdesc="A general astronomical image processing software"
arch=('i686' 'x86_64')
url="http://munipack.physics.muni.cz"
license=('GPL3')
depends=(cfitsio wxgtk2)
makedepends=(gcc-fortran)
source=(ftp://munipack.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('dbd91d8a85adf422f422234d0da7bf03')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
