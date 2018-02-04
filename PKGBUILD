# Contributor: shamrok <szamrok@gmail.com>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# Contributor: marvn <mistrmarvn@gmail.com>
# Contributor: Marek Jędryka <marek629@poczta.onet.pl>
 
pkgname=sir
pkgver=3.2
pkgrel=1
pkgdesc="Simple image resizer in Qt" 
arch=('i686' 'x86_64')
url="http://marek629.github.io/SIR/" 
license=('GPLv2') 
depends=('qt5-base' 'qt5-imageformats' 'qt5-svg' 'exiv2')
makedepends=('qt5-tools' 'cmake')
optdepends=("dcraw: RAW images support")
source=("https://www.dropbox.com/s/85pexiurs2354bs/sir_$pkgver.tar.gz?dl=1")

build() {
     cd "$srcdir/$pkgname"
     [ -d bld ] || mkdir bld && cd bld
     cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
              -Dmetadata=ON -Dqt5=ON
     make sir || return 1 
}
package() {
     cd "$srcdir/$pkgname/bld"
     make DESTDIR="$pkgdir/" install
}  
sha1sums=('36f6c0ef7de96a85b208a779b772f07a1700a937')
