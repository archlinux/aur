# Contributor: Zdenek Janak <janak@physics.muni.cz>

pkgname=munipack
pkgver=0.5.6
pkgrel=1
pkgdesc="General astronomical photometry software package"
arch=('i686' 'x86_64')
url="http://munipack.physics.muni.cz/"
license=('GPL3')
depends=(cfitsio wxgtk webkitgtk2)
makedepends=(gcc-fortran)
optdepends=('fitspng: for FITS to PNG conversion'
            'rawtran: for RAW to FITS conversion')
source=(ftp://integral.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f609ee8cba91fdb63c5a3bf90277b812')

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
