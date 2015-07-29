# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: Feng Wang <wanng.fenng AT gmail DOT com>
pkgname=gmm
pkgver=5.0
pkgrel=1
pkgdesc="Generic C++ finite element library"
arch=('i686' 'x86_64')
url="http://home.gna.org/getfem/"
license=('LGPL')
source=("http://download.gna.org/getfem/stable/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dc201ec2fd480a242c0f47cef0d9d1fc0ec5549ed73d91a8c2f877e15ee53a7f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

check(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

