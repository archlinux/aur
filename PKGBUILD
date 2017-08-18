pkgname=python-pyqtdatavis
pkgver=5.9
pkgrel=1
pkgdesc="Python bindings for the Qt Data Visualisation library"
url="https://www.riverbankcomputing.com/software/pyqtdatavisualization"
depends=('python-pyqt5')
license=('GPLv3')
arch=('any')
source=(https://sourceforge.net/projects/pyqt/files/PyQtDataVisualization/PyQtDataVisualization-$pkgver/PyQtDataVisualization_gpl-$pkgver.tar.gz)
sha1sums=('22b7e07060db42760e93d17381beed8dbcbfebe5')

package() {
  cd $srcdir/PyQtDataVisualization_gpl-$pkgver
  _moddir=$pkgdir/usr/lib/python3.6/site-packages/PyQt5
  _sipdir=$pkgdir/usr/share/sip/PyQt5
  _apidir=$pkgdir/usr/share/qt/qsci
  mkdir -p $_sipdir
  python configure.py -d $_moddir --stubsdir=$_moddir -v $_sipdir -a $_apidir
  make install
}
