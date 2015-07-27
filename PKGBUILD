# Contributor: shamrok <szamrok@gmail.com>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# Contributor: marvn <mistrmarvn@gmail.com>
# Contributor: Marek Jędryka <marek629@poczta.onet.pl>
 
pkgname=sir
pkgver=2.8
pkgrel=1
pkgdesc="Simple image resizer in Qt" 
arch=('i686' 'x86_64')
url="http://marek629.github.io/SIR/" 
license=('GPLv2') 
depends=('qt5-base' 'qt5-svg' 'exiv2')
makedepends=('qt5-tools' 'cmake')
optdepends=("dcraw: RAW images support")
source=("https://googledrive.com/host/0B9Il9AGwsKEvLVpDVmIwbHVoYlE/sir_$pkgver.tar.gz") 

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
sha1sums=('abae7a0c1f2ba3493c7e7900ed7ef63926f2d375')
