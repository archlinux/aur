# Maintainer: Gustavo Castro << gustawho [at] gmail [dot] com >>

pkgname=gwtool
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple tools for working with gravitational waves"
arch=('any')
url="http://gwtool.sourceforge.net/"
license=('GPLv3')
depends=('cmake' 'libsufr')
source=("http://sourceforge.net/projects/gwtool/files/latest/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0a2208c9098b5e433fe410e703d3637abdab494f8f235ccacf78f4b65e2b07fcdb778c3f69453e58607f9af7a089f838f6f956c97ac54864d4b05ec4161a30a7')

build() {
  cd "${srcdir}/gwtool-${pkgver}"
  mkdir build && cd build/
  cmake ..
  make        
}
package() {
  cd "${srcdir}/gwtool-${pkgver}/build/"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
