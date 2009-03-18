# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=0.10.0
pkgrel=1
pkgdesc="Digital photo management application for kde"
arch=(i686 x86_64)
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('libgphoto2' 'lcms' 'kdegraphics' 'kdepimlibs' 'jasper>=1.900.1' 'lensfun')
makedepends=('pkgconfig' 'cmake')
source=(http://downloads.sourceforge.net/digikam/${pkgname}-0.10.0.tar.bz2)
replaces=('digikamimageplugins')
optdepends=('kipi-plugins: for more extras and plugins')
md5sums=('6c6daf958ff4fe93974f1074ba967cd9')

build() {
  cd ${srcdir}/${pkgname}-0.10.0
   cmake . -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_MARBLEWIDGET=no -DWITH_MarbleWidget=no
   make all|| return 1
   make DESTDIR=${pkgdir} install || return 1
 }
