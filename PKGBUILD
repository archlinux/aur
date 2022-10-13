# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: yochananmarqos
pkgname=python-fbs
_name=fbs
pkgver=1.1.5
pkgrel=1
pkgdesc="Python and Qt-based lightweight alternative to Electron"
arch=('any')
url="https://build-system.fman.io/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-pyqt5: Qt5 Python bindings'
            'pyside2: PySide Qt5 Python bindings'
            'python-sentry_sdk: upload errors that occur in your app to Sentry'
            'python-boto3: AWS support')
source=("${_name}-${pkgver}.tar.gz"::"https://github.com/mherrmann/fbs/archive/v${pkgver}.tar.gz")
sha256sums=('b8323717b0da54c8d3fac44215f685ca14655122611c095862c97e07d53be2c6')
sha512sums=('41e6b6e95650e5d6f86feb85c7582cb21d7bae93aeb2e92b348052fa48c13590c2d520c1e56d895027a33c7c2cf08e482d2ef4a9cd1e5113be01bf93512535dc')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
