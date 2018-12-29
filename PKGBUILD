# Maintainer: Brian Bidulock <bidulock@openss7.org>
# contributor: tantalum <tantalum@online.de>
pkgname=guile-cairo
pkgver=1.10.0
pkgrel=1
pkgdesc='Guile Scheme bindings for the cairo graphics library'
arch=(x86_64 i686)
license=(LGPL3)
depends=('guile>=1.8.0' 'cairo>=1.2.0')
url=http://www.non-gnu.org/guile-cairo/
source=(http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('03417b370a822c3e0be0795930f7878f')

build(){
   cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
