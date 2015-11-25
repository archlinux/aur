pkgname=dlt-viewer
pkgver=1.15
pkgrel=1
pkgdesc="Diagnostic Log and Trace client viewer"
url="http://projects.genivi.org/diagnostic-log-trace/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('qt5-base')
makedepends=('qt5-base')
optdepends=('xdg-utils')
source=("git://git.projects.genivi.org/dlt-viewer.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  qmake BuildDltViewer.pro
  make
}

package() {
  cd "$srcdir/$pkgname"
  make INSTALL_ROOT="${pkgdir}" install 
}
