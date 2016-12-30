# Contributor: shamrok <szamrok@gmail.com>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# Contributor: marvn <mistrmarvn@gmail.com>
# Contributor: Marek Jędryka <marek629@poczta.onet.pl>
 
pkgname=sir
pkgver=3.1
pkgrel=2
pkgdesc="Simple image resizer in Qt" 
arch=('i686' 'x86_64')
url="http://marek629.github.io/SIR/" 
license=('GPLv2') 
depends=('qt5-base' 'qt5-imageformats' 'qt5-svg' 'exiv2')
makedepends=('qt5-tools' 'cmake')
optdepends=("dcraw: RAW images support")
source=("https://www.dropbox.com/s/zrapo9tb97nv9sd/sir_$pkgver.tar.gz?dl=1") 

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
sha1sums=('8e0a104ba6dacf97cda2eb1a8ce392d67b49f96f')
