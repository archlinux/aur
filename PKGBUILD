# Contributor: shamrok <szamrok@gmail.com>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# Contributor: marvn <mistrmarvn@gmail.com>
# Contributor: Marek Jędryka <marek629@poczta.onet.pl>

pkgname=sir
pkgver=3.2.2
pkgrel=1
pkgdesc="Simple image resizer in Qt"
arch=('i686' 'x86_64')
url="http://marek629.github.io/SIR/"
license=('GPL-2.0')
depends=('qt5-base' 'qt5-imageformats' 'qt5-svg' 'exiv2')
makedepends=('qt5-tools' 'cmake')
optdepends=("dcraw: RAW images support")
source=("https://www.dropbox.com/scl/fi/s7rbzypqgt0bpxvnk0rcj/sir_$pkgver.tar.gz?rlkey=6umn2wiul64qecqo6i3iq42aj&st=d5azbxwo&dl=0")

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
sha1sums=('2df5ddf38d4f6f87988d5c311ba3b42e5ab9b09d')
