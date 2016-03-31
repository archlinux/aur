# Maintainer: Georgy Farniev <georgy.farniev@gmail.com>

pkgname=litetran-git
pkgver=1.2.82.gc9cd6d2
pkgrel=1
pkgdesc="The powerful translator on Qt5 - GIT version"
arch=("i686" "x86_64")
url="https://bitbucket.org/gfarniev/litetran"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-tools' 'qt5-x11extras')
makedepends=('cmake' 'git')
conflicts=('litetran')
provides=('litetran')
source=(litetran::git+https://bitbucket.org/gfarniev/litetran.git)
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/litetran"
    git describe --always | sed 's|-|.|g'
}

build() {
   cd "${srcdir}/litetran"
   cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
    
  make 
}

package(){
  cd "${srcdir}/litetran"
  make install DESTDIR=${pkgdir}
}
