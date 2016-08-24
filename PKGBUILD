# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok
pkgver=0.4.0
pkgrel=2
pkgdesc='Client software that supports various hardware logic analyzers, core library'
arch=(i686 x86_64)
url='http://www.sigrok.org/wiki/Libsigrok'
license=(GPL3)
depends=(libftdi libserialport glibmm libzip libieee1284)
makedepends=(doxygen swig python pygobject-devel python-numpy python-setuptools)
optdepends=('python')
source=(http://sigrok.org/download/source/libsigrok/libsigrok-$pkgver.tar.gz)
sha1sums=('6d57bea676ce60b6591162c45854ede6f9d8ceb9')

build() {
  cd libsigrok-$pkgver
  ./configure --prefix=/usr --disable-ruby --disable-java
  make
}

package() {
  cd libsigrok-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
