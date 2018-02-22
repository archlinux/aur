# Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=boomaga-qt5
_name=boomaga
pkgver=1.2.0
pkgrel=1
pkgdesc="is a virtual printer for viewing a document before printing it out using the physical printer - QT5 version"
arch=('i686' 'x86_64')
url="http://www.boomaga.org/"
license=('LGPL')
depends=('qt5-tools' 'poppler')
makedepends=('cmake' 'cups'  'snappy')
conflicts=('boomaga')
source=("https://github.com/Boomaga/boomaga/archive/v$pkgver.tar.gz")


build() {
 cd $_name-$pkgver
 cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
   make 
}

package() {
  cd $_name-$pkgver
    make "DESTDIR=$pkgdir" install
  install -D -m755 $srcdir/$_name-$pkgver/scripts/installPrinter.sh ${pkgdir}/usr/bin/
}
sha256sums=('bbb1578350a36041a4bae7146cdf0fc4cc3654daa98becd80e04838083577bb5')
