# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
 
pkgname=grooveoff-qt5
pkgver=0.2.0
pkgrel=1
pkgdesc="Offline Grooveshark.com music."
arch=('i686' 'x86_64')
url=('http://gcala.blogspot.com/2013/04/presenting-grooveoff.html')
license=('GPL')
depends=('qt5-base' 'qt5-svg' 'phonon-qt5' 'gstreamer0.10-ugly-plugins' 'ca-certificates' 'taglib')
makedepends=('cmake' 'qt5-tools')
source=("http://qt-apps.org/CONTENT/content-files/158258-grooveoff-$pkgver.tar.gz")
provides=('grooveoff')
conflicts=('grooveoff')

md5sums=('fa4d686306b31064e2e7e7dfaec33fa1')
 
package() {
    cd "$srcdir/grooveoff-$pkgver"
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_SKIP_RPATH=ON -DBUILD_WITH_QT5=ON \
             -DPHONON4QT5_INCLUDES=/usr/include/phonon4qt5
    make
    make DESTDIR="$pkgdir" install
}
