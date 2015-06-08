# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: Feng Wang <wanng.fenng AT gmail DOT com>
pkgname=gmm
pkgver=4.3
pkgrel=3
pkgdesc="Generic C++ finite element library"
arch=('i686' 'x86_64')
url="http://home.gna.org/getfem/"
license=('LGPL')
source=("http://download.gna.org/getfem/stable/${pkgname}-${pkgver}.tar.gz")
md5sums=('f64441d4f85c6a37b8ae1cc70649b795')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr

  make
}

check(){
  cd ${srcdir}/${pkgname}-${pkgver}

  make check
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}

