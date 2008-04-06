# $Id: PKGBUILD,v 1.28 2008/04/02 22:20:57 tobias Exp $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=0.9.3
pkgrel=2
pkgdesc="Digital photo management application for kde"
arch=(i686 x86_64)
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('sqlite3' 'libkipi' 'libgphoto2' 'exiv2>=0.16' 'lcms' 'dcraw' 'libkexiv2>=0.1.6' 'jasper>=1.900.1' 'lcms' 'libkdcraw>=0.1.2')
makedepends=('pkgconfig')
source=(http://garr.dl.sourceforge.net/sourceforge/digikam/${pkgname}-${pkgver}.tar.bz2)
replaces=('digikamimageplugins')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
   
   #Optimisations which work for i686 only
   if [ "$CARCH" = "i686" ]; 
   then ./configure --prefix=/opt/kde --disable-debug --enable-gcc-hidden-visibility
   else ./configure --prefix=/opt/kde --disable-debug
   fi
   
   make || return 1
   make DESTDIR=${startdir}/pkg/ install
 }
md5sums=('20497c1a02394505f899ef0757ebefad')
