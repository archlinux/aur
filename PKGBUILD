pkgname=python-pyqtchart
pkgver=5.8
pkgrel=1
pkgdesc="Python bindings for the Qt Charts library"
url="https://www.riverbankcomputing.com/software/pyqtchart/"
depends=('python-pyqt5')
license=('GPLv3')
arch=('any')
source=(https://sourceforge.net/projects/pyqt/files/PyQtChart/PyQtChart-$pkgver/PyQtChart_gpl-$pkgver.tar.gz)
md5sums=('4c7939b70f3fa6e9418057fb08af7d52')

package() {
  cd $srcdir/PyQtChart_gpl-$pkgver
  _moddir=$pkgdir/usr/lib/python3.6/site-packages/PyQt5
  _sipdir=$pkgdir/usr/share/sip/PyQt5
  _apidir=$pkgdir/usr/share/qt/qsci
  mkdir -p $_sipdir
  python configure.py -d $_moddir --stubsdir=$_moddir -v $_sipdir -a $_apidir
  make install
}
