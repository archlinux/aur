# Contributer: SolarAquarion (Shlomo Choina  at gmail dot com)

pkgname=rkward-git
pkgver=v0.7.3.r614.g006263f89
pkgrel=1
pkgdesc="An Easy to use, transparent frontend to the R-language"
arch=('i686' 'x86_64')
url="https://rkward.kde.org/"
license=('GPL')
depends=('qt5-base' 'r' 'docbook-xml' 'kxmlgui5' 'kcodecs5' 'qt5-webengine' 'ktexteditor5' 'knotifications5')
makedepends=('cmake' 'docbook-xsl' 'git' 'extra-cmake-modules' 'kdoctools5')
provides=('rkward')
conflicts=('rkward-git' 'rkward')
source=(git+https://invent.kde.org/education/rkward.git)

pkgver(){
 cd $srcdir/rkward
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
 }
build() {
cd $srcdir/rkward
cmake -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE:STRING="RelWithDebInfo" \
  -DCMAKE_INSTALL_LIBDIR=lib
make
}

package(){
	cd $srcdir/rkward
	make DESTDIR="$pkgdir" install
}
md5sums=('SKIP')
