# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=wmcpuwatch
pkgver=0.2
pkgrel=2
pkgdesc="A dockapp to show the load of every logical CPU on the system"
url="https://bitbucket.org/StarFire/wmcpuwatch"
license=('GPL3')
arch=('x86_64' 'i686')
depends=('libdockapp')
makedepends=('cmake' 'doxygen')
source=("https://bitbucket.org/StarFire/wmcpuwatch/downloads/wmcpuwatch-${pkgver}.tar.bz2")
source=("ftp://ftp2.de.debian.org/gentoo/distfiles/a1/wmcpuwatch-0.2.tar.bz2")
md5sums=('bf6081e07775febe6032c81d6525ad14')

build() {
  cd ${pkgname}-${pkgver}
 
  cmake  -DCMAKE_INSTALL_PREFIX=/usr .
  make package
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
