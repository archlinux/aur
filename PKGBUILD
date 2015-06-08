# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
 
pkgname=grooveoff
pkgver=0.2.0
pkgrel=1
pkgdesc="Offline Grooveshark.com music."
arch=('i686' 'x86_64')
url=('http://gcala.blogspot.com/2013/04/presenting-grooveoff.html')
license=('GPL')
depends=('qt4' 'phonon' 'qjson' 'gstreamer0.10-ugly-plugins' 'ca-certificates' 'taglib')
makedepends=('cmake' 'automoc4')
source=("http://qt-apps.org/CONTENT/content-files/158258-$pkgname-$pkgver.tar.gz")
 
md5sums=('fa4d686306b31064e2e7e7dfaec33fa1')
 
package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
    make DESTDIR="$pkgdir" install
}
