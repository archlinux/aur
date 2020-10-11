# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=python-fbs
_name=fbs
pkgver=0.9.0
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
sha256sums=('5c08dff7a4da5f97958d57bea8dbae56286dbe9090ab5805fd5f6e24243394e2')
sha512sums=('b984b34e3c9432e7079af230abd5bf758f7c54a2592ee6e205da40b7f61945dadd4576e4b1c5f63ad6c466f720c3e58e892e0e8654b4f0c1e0cd27fd728919a5')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
