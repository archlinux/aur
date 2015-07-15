
pkgname=ctrlwm
pkgver=0_8_0_9
pkgrel=3
pkgdesc="Is a customisable tool for automatic windows positioning and sizing."
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/ctrlwm?content=114565"
license=('GPL')
depends=('libxtst' 'libxmu' 'glib2')
makedepends=('make' 'cmake' 'xorg-server-devel')
source=("https://opendesktop.org/CONTENT/content-files/114565-${pkgname}_${pkgver}_pack.tar.gz")
md5sums=('ce19612dffcf06487d86d5d054f06a0a')
#option=(strip)
#install=${pkgname}.install

build() {
  cd $srcdir/${pkgname}_${pkgver}_pack
  tar xvf ${pkgname}_${pkgver}.tar.gz && cd ${pkgname}_${pkgver}
 ./configure --prefix=/usr
  make clean && make DESTDIR="${pkgdir}" install
}
