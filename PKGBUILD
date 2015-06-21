# Maintainer: flu

pkgname=neptune-triton
pkgdesc="Fractal explorer and fractal expander"
license=('GPL')
pkgver=1.1.0
pkgrel=1
depends=('boost' 'boost-libs' 'gmp' 'qt4' 'mpfr')
arch=('i686' 'x86_64')
url=('http://element90.wordpress.com/software/')
source=('https://copy.com/H3pHYNItJdyH')
sha512sums=('d146dd8383381e8e268a24f59c828f9c004d55b3580696e3f174cab64cf2b0682e3ff4710ac10d04f9bcfaabbd52e0985afcb3d4961bc9b304b747349a1751e5')

build() {
  export QT_SELECT=4
  export CXX=g++

  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
