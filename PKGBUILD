pkgname=qoobar
pkgver=1.6.9.1
pkgrel=1
pkgdesc="Qoobar - Audio Tagger for Classical Music"
arch=('i686' 'x86_64')
url="http://qoobar.sourceforge.net"
license=('GPL')
depends=('qt5-base' 'gstreamer0.10-base' 'flac' 'libdiscid' 'enca' 'shntool')
source=("http://downloads.sourceforge.net/sourceforge/qoobar/qoobar-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('1c666dc58d634fb86e53aef231d01b67')

build() {
  cd  "$srcdir/${pkgname}-${pkgver}"
  qmake PREFIX=/usr
  make
}

package() {
 cd "$srcdir/${pkgname}-${pkgver}/"
 make INSTALL_ROOT=${pkgdir} install
}
