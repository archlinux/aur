# maintainer : fenugrec
# contributors : xantares,  icarus 
pkgname=freediag
pkgver=1.08
pkgrel=1
pkgdesc="OBD-II vehicle diagnostic software and (mostly) J1978 compliant scan tool."
arch=('i686' 'x86_64')
url="http://freediag.sourceforge.net/"
license=('GPL')
makedepends=('cmake')
depends=('glibc')
optdepends=('fltk: needed for scangui front-end'
		'readline: better CLI')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/1.0/$pkgname-$pkgver-src.tar.gz")
sha256sums=('ec0d857538999e1e36f5564c64f652df46fc840d9d406ed053304cf22cc0e551')

build() {
  cd "$pkgname-$pkgver-src"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILDGUI=ON -DUSE_RCFILE=ON -DUSE_INIFILE=ON
  make
}


package () {
  cd "$pkgname-$pkgver-src"
  make DESTDIR="$pkgdir" install
}

