pkgname=dlt-viewer
pkgver=2.20.3
pkgrel=1
pkgdesc="Diagnostic Log and Trace client viewer"
url="https://github.com/GENIVI/dlt-viewer/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=(qt5-base qt5-serialport)
_commit=402d6d0dd87a1a82b36481bd8dc06bbcfbb44150  # tags/v2.20.3^0
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
