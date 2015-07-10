# contributor: tantalum <tantalum@online.de>
pkgname=guile-cairo
pkgver=1.9.91
pkgrel=2
pkgdesc='Guile Scheme bindings for the cairo graphics library'
arch=(x86_64 i686)
license=(LGPL3)
depends=('guile>=1.8.0' 'cairo>=1.2.0')
url=http://www.non-gnu.org/guile-cairo/
install=$pkgname.install
source=(http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=(bc8f4f00d1d351f85e0235636a113ad6)

build(){
   cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
