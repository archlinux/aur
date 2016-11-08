pkgname=dlt-viewer
pkgver=2.18.0
pkgrel=1
pkgdesc="Diagnostic Log and Trace client viewer"
url="http://projects.genivi.org/diagnostic-log-trace/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=(qt5-base qt5-serialport)
_commit=c52fcd34b46a65780c3a43c2b6e7fe85f4385c79  # tags/v2.18.0^0
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
