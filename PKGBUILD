pkgname=dlt-viewer
pkgver=2.19.0
pkgrel=1
pkgdesc="Diagnostic Log and Trace client viewer"
url="https://github.com/GENIVI/dlt-viewer/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=(qt5-base qt5-serialport)
_commit=b73ee1292f551136e20f3fa83cc16ab4c66f6fd4  # tags/v2.19.0^0
source=("git://github.com/GENIVI/dlt-viewer.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  qmake BuildDltViewer.pro
  make
}

package() {
  cd "$srcdir/$pkgname"
  make INSTALL_ROOT="${pkgdir}" install 
}
