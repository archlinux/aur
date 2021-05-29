# Contributor: shamrok <szamrok@gmail.com>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# Contributor: marvn <mistrmarvn@gmail.com>
# Contributor: Marek Jędryka <marek629@poczta.onet.pl>
 
pkgname=sir
pkgver=3.2.1
pkgrel=1
pkgdesc="Simple image resizer in Qt" 
arch=('i686' 'x86_64')
url="http://marek629.github.io/SIR/" 
license=('GPLv2') 
depends=('qt5-base' 'qt5-imageformats' 'qt5-svg' 'exiv2')
makedepends=('qt5-tools' 'cmake')
optdepends=("dcraw: RAW images support")
source=("https://www.dropbox.com/s/mh3oaygh6y4rro3/sir_$pkgver.tar.gz?dl=1")

build() {
     cd "$srcdir/SIR-$pkgver"
     [ -d bld ] || mkdir bld && cd bld
     cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
              -Dmetadata=ON -Dqt5=ON
     make sir || return 1 
}
package() {
     cd "$srcdir/SIR-$pkgver/bld"
     make DESTDIR="$pkgdir/" install
}  
sha1sums=('4dc7e38641db8f7aeb0867f79d02dd2d2b28b3b0')
