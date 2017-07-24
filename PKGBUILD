# Maintainer: Zdenek Janak <janak@astronomie.cz>
pkgname=munipack
pkgver=0.5.9
pkgrel=1
pkgdesc="A general astronomical image processing software"
arch=('i686' 'x86_64')
url="http://munipack.physics.muni.cz/"
license=('GPL3')
depends=(cfitsio wxgtk2)
makedepends=(gcc-fortran)
optdepends=('fitspng: for FITS to PNG conversion'
            'rawtran: for RAW to FITS conversion')
source=(ftp://integral.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e95008291ee3cfb10d51893acb35a24f')

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
