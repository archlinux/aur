pkgname=python-pyqtchart
pkgver=5.9
pkgrel=2
pkgdesc="Python bindings for the Qt Charts library"
url="https://www.riverbankcomputing.com/software/pyqtchart/"
depends=('python-pyqt5' 'qt5-charts')
license=('GPLv3')
arch=('any')
source=(https://sourceforge.net/projects/pyqt/files/PyQtChart/PyQtChart-$pkgver/PyQtChart_gpl-$pkgver.tar.gz)
sha1sums=('b9abda947da2752efdc5268271f9fdf7f942e1dd')

package() {
  cd $srcdir/PyQtChart_gpl-$pkgver
  _moddir=$pkgdir/usr/lib/python3.6/site-packages/PyQt5
  _sipdir=$pkgdir/usr/share/sip/PyQt5
  _apidir=$pkgdir/usr/share/qt/qsci
  mkdir -p $_sipdir
  python configure.py -d $_moddir --stubsdir=$_moddir -v $_sipdir -a $_apidir
  make install
}
