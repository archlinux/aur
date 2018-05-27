# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('tuiview')
pkgver=1.2.3
pkgrel=1
pkgdesc="Lightweight raster GIS viewer and attribute table writer"
arch=('i686' 'x86_64')
url='http://tuiview.org'
license=('GPL2')
makedepends=('python-numpy' 'python-gdal' 'python-pyqt5')
depends=("${makedepends[@]}")
optdepends=('kealib: KEA raster file format support')
options=(!emptydirs)
_srcpath="TuiView-$pkgver"
source=("https://bitbucket.org/chchrsc/$pkgname/downloads/$_srcpath.tar.gz")
sha256sums=('6c63ae83a7e845b5f96316cdb7d7007e1c74158e47e2a75d8dcc5a22e24e1c31')

package() {
  cd "$srcdir/$_srcpath"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
