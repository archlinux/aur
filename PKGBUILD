pkgname=qoobar
pkgver=1.6.8
pkgrel=1
pkgdesc="Qoobar - Audio Tagger for Classical Music"
arch=('i686' 'x86_64')
url="http://qoobar.sourceforge.net"
license=('GPL')
depends=('qt5-base' 'gstreamer' 'flac' 'libdiscid' 'enca' 'shntool')
source=("http://downloads.sourceforge.net/sourceforge/qoobar/qoobar-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('335599660806c8600c919ca194ebe8cb')

build() {
  cd  "$srcdir/${pkgname}-${pkgver}"
  qmake qoobar.pro PREFIX=/usr
  make
}

package() {
 cd "$srcdir/${pkgname}-${pkgver}/"
 make INSTALL_ROOT=${pkgdir} install
}
