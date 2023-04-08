# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-purchasing
pkgname=(python-pyqt5-purchasing)
pkgver=5.15.5
pkgrel=4
pkgdesc='Python bindings for QtPurchasing'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtpurchasing/intro'
license=(GPL3)
groups=(pyqt5)
depends=(qt5-purchasing python-pyqt5)
makedepends=(sip pyqt-builder)
conflicts=(python-pyqtpurchasing)
provides=(python-pyqtpurchasing)
replaces=(python-pyqtpurchasing)
source=(https://pypi.python.org/packages/source/P/PyQtPurchasing/PyQtPurchasing-$pkgver.tar.gz)
sha256sums=('8bb1df553ba6a615f8ec3d9b9c5270db3e15e831a6161773dabfdc1a7afe4834')

build() {
  cd PyQtPurchasing-$pkgver
  sip-build \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python
  cd build
  make
}

package_python-pyqt5-purchasing() {
  cd PyQtPurchasing-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
