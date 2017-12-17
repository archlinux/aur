# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=wmcpuwatch
pkgver=0.2
pkgrel=1
pkgdesc="A dockapp to show the load of every logical CPU on the system"
url="https://bitbucket.org/StarFire/wmcpuwatch"
license=('GPL3')
arch=('x86_64')
depends=('libdockapp')
makedepends=('doxygen')
source=("https://bitbucket.org/StarFire/wmcpuwatch/downloads/wmcpuwatch-${pkgver}.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
 
  cmake  -DCMAKE_INSTALL_PREFIX=/usr .
  make package
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

md5sums=('bf6081e07775febe6032c81d6525ad14')
