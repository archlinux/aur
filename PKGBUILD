# Contributor: sxe <sxxe @ gmx.de>
pkgname=loopy
pkgver=0.5.3
pkgrel=1
pkgdesc="Simple video player for KDE, based on the phonon libraries."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Loopy?content=120880"
license=("GPL")
depends=('kdelibs>=4.3')
makedepends=('cmake' 'automoc4')
source=(http://kde-apps.org/CONTENT/content-files/120880-${pkgname}_${pkgver}.tar.gz)

build() {
  cd ${pkgname}_${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}


md5sums=('8297f27b6b6ce44be3ff0b387c750edc')
